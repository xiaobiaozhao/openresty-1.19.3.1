local base = require "resty.core.base"
base.allows_subsystem("http")

local ffi = require "ffi"
local C = ffi.C

ffi.cdef [[
int ngx_http_lua_fork(const char* name);
]]

if
    not pcall(
        function()
            return C.ngx_http_lua_fork
        end
    )
 then
    error(
        "fork API is not supported due to either a platform issue " ..
            "or lack of the HAVE_SOCKET_CLOEXEC_PATCH patch",
        2
    )
end

local _M = {version = base.version}
local function sleep(sec)
    os.execute("sleep " .. sec)
end
local function fork(name, fork_proc, ...)
    if "function" ~= type(fork_proc) then
        return -2, "fork_proc must function"
    end

    if not name then
        return -2, "not name"
    end

    local pid = C.ngx_http_lua_fork(name)
    if 0 == pid then
        -- call fork_proc
        -- 替换 sleep timer* 相关的函数
        local rc = fork_proc(...)
        os.exit(rc)
    end
end

_M.fork = fork

return _M
