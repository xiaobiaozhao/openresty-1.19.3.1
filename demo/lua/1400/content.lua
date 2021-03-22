local fork = require "ngx.fork"

ngx.say("ok")

local function forked(name)
    for i = 1, 2 do
        ngx.log(ngx.ERR, name .. "\t子进程 " .. ngx.worker.pid())
        os.execute("sleep 1")
        --ngx.sleep(1)
    end
end

fork.fork("proc-zxb", forked, "zhao")
