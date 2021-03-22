local fork = require "ngx.fork"

ngx.say("ok")

local function forked()
    for i = 1, 2 do
        ngx.log(ngx.ERR, "子进程 " .. ngx.worker.pid())
        --ngx.sleep(1)
    end
end

fork.fork("proc-zxb", forked)
