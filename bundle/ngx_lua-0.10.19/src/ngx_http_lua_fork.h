#ifndef _NGX_HTTP_FORK_H_INCLUDED_
#define _NGX_HTTP_FORK_H_INCLUDED_

#include "ngx_http_lua_common.h"

typedef struct {
    int signo;
    char* signame;
} ngx_http_lua_fork_signal_t;

#endif /* _NGX_HTTP_FORK_H_INCLUDED_ */

/* vi:set ft=c ts=4 sw=4 et fdm=marker: */