local ffi = require("ffi")

ngx.say("ok")

ffi.cdef [[
    int ngx_http_lua_fork(const char* name);
]]

local pid = ffi.C.ngx_http_lua_fork("zxb-proc")

if 0 == pid then
    --os.exit(-1)
    for i = 1, 2 do
        ngx.log(ngx.ERR, "子进程 " .. ngx.worker.pid())
        --ngx.sleep(1)
    end
    os.exit(-1)
else
    --ngx.sleep(0.01)
    ngx.say("子进程:" .. pid .. " 主进程结束了 " .. ngx.worker.pid())
end
