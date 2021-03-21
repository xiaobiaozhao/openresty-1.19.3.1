#ifndef DDEBUG
#define DDEBUG 0
#endif
#include "ngx_http_lua_fork.h"
#include "ddebug.h"

static ngx_http_lua_fork_signal_t ngx_signals[] = {
    { SIGSYS, "SIGSYS" },
    { SIGPIPE, "SIGPIPE" },
    { 0, NULL }
};

int ngx_http_lua_fork(char* name)
{
    ngx_pid_t pid;
    ngx_uint_t i;
    struct sigaction sa;
    ngx_http_lua_fork_signal_t* sig;
    sigset_t set;

    /* fork */
    pid = fork();

    if (pid == -1) {
        ngx_log_error(NGX_LOG_ERR, ngx_cycle->log, ngx_errno, strerror(errno));
        return pid;
    }

    if (pid == 0) {

#if (NGX_HAVE_CPU_AFFINITY)
        /* reset the CPU affinity mask */
        ngx_uint_t log_level;
        ngx_cpuset_t child_cpu_affinity;

        if (ngx_process == NGX_PROCESS_WORKER
            && ngx_get_cpu_affinity(ngx_worker) != NULL) {
            CPU_ZERO(&child_cpu_affinity);

            for (i = 0; i < (ngx_uint_t)ngx_min(ngx_ncpu, CPU_SETSIZE); i++) {
                CPU_SET(i, &child_cpu_affinity);
            }

            log_level = ngx_cycle->log->log_level;
            ngx_cycle->log->log_level = NGX_LOG_WARN;
            ngx_setaffinity(&child_cpu_affinity, ngx_cycle->log);
            ngx_cycle->log->log_level = log_level;
        }
#endif
        ngx_setproctitle(name);
        ngx_pid = ngx_getpid();

        /* reset the handler of ignored signals to the default */
        for (sig = ngx_signals; sig->signo != 0; sig++) {
            ngx_memzero(&sa, sizeof(struct sigaction));
            sa.sa_handler = SIG_DFL;

            if (sigemptyset(&sa.sa_mask) != 0) {
                ngx_log_error(NGX_LOG_ERR, ngx_cycle->log, ngx_errno,
                    "lua fork child init signal mask failed");
                exit(EXIT_FAILURE);
            }

            if (sigaction(sig->signo, &sa, NULL) == -1) {
                ngx_log_error(NGX_LOG_ERR, ngx_cycle->log, ngx_errno,
                    "lua fork child reset signal handler for %s "
                    "failed",
                    sig->signame);
                exit(EXIT_FAILURE);
            }
        }

        /* reset signal mask */
        if (sigemptyset(&set) != 0) {
            ngx_log_error(NGX_LOG_ERR, ngx_cycle->log, ngx_errno,
                "lua fork child init signal set failed");
            exit(EXIT_FAILURE);
        }

        if (sigprocmask(SIG_SETMASK, &set, NULL) != 0) {
            ngx_log_error(NGX_LOG_ERR, ngx_cycle->log, ngx_errno,
                "lua fork child reset signal mask failed");
            exit(EXIT_FAILURE);
        }

        /* close listening socket fd */

        ngx_listening_t* ls;
        ls = ngx_cycle->listening.elts;
        for (i = 0; i < ngx_cycle->listening.nelts; i++) {
            ngx_log_error(NGX_LOG_EMERG, ngx_cycle->log, ngx_socket_errno,
                "listen addr %V ",
                &ls[i].addr_text);
            if (ngx_close_socket(ls[i].fd) == -1 || 1) {
                ngx_log_error(NGX_LOG_EMERG, ngx_cycle->log, ngx_socket_errno,
                    "lua fork child " ngx_close_socket_n
                    " %V failed",
                    &ls[i].addr_text);
            }
        }

        //ngx_close_listening_sockets(ngx_cycle);

        ngx_close_idle_connections(ngx_cycle);

        ngx_cycle->connection_n = 512;

        ngx_use_accept_mutex = 0;
    }

    return pid;
}