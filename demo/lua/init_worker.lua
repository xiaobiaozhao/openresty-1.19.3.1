local process = require "ngx.process"
    ngx.log(ngx.ERR, process.type())
    local ffi = require "ffi"

    --ffi.cdef [[
    --    int fork(void);
    --]]

    --local pid = ffi.C.fork()
    --if pid ~= 0 then
    --    while true do
    --        ngx.log(ngx.ERR, ngx.worker.pid())
    --    end
    --end
ngx.log(ngx.ERR, pid)