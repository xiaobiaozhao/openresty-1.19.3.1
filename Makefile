.PHONY: all install clean

all:
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/LuaJIT-2.1-20201027 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/home/xiaobiaozhao/bin/openresty/luajit
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-cjson-2.1.0.8 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/xiaobiaozhao/bin/openresty/lualib LUA_MODULE_DIR=/home/xiaobiaozhao/bin/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-signal-0.02 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/nginx-1.19.3 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/home/xiaobiaozhao/bin/openresty/
	-cp /home/xiaobiaozhao/openresty-1.19.3.1/COPYRIGHT $(DESTDIR)/home/xiaobiaozhao/bin/openresty/
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/LuaJIT-2.1-20201027 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/home/xiaobiaozhao/bin/openresty/luajit DESTDIR=$(DESTDIR)
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-cjson-2.1.0.8 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/xiaobiaozhao/bin/openresty/lualib LUA_MODULE_DIR=/home/xiaobiaozhao/bin/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-signal-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/xiaobiaozhao/openresty-1.19.3.1/build/luajit-root/home/xiaobiaozhao/bin/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib CC=cc
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-dns-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-memcached-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-redis-0.29 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-mysql-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-string-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-websocket-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-lock-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-lrucache-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-core-0.1.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-upstream-healthcheck-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-limit-traffic-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/lua-tablepool-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/xiaobiaozhao/bin/openresty/lualib INSTALL=/home/xiaobiaozhao/openresty-1.19.3.1/build/install
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/opm-0.0.5 && /home/xiaobiaozhao/openresty-1.19.3.1/build/install bin/* $(DESTDIR)/home/xiaobiaozhao/bin/openresty/bin/
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/resty-cli-0.27 && /home/xiaobiaozhao/openresty-1.19.3.1/build/install bin/* $(DESTDIR)/home/xiaobiaozhao/bin/openresty/bin/
	cp /home/xiaobiaozhao/openresty-1.19.3.1/build/resty.index $(DESTDIR)/home/xiaobiaozhao/bin/openresty/
	cp -r /home/xiaobiaozhao/openresty-1.19.3.1/build/pod $(DESTDIR)/home/xiaobiaozhao/bin/openresty/
	cd /home/xiaobiaozhao/openresty-1.19.3.1/build/nginx-1.19.3 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/home/xiaobiaozhao/bin/openresty/site/lualib $(DESTDIR)/home/xiaobiaozhao/bin/openresty/site/pod $(DESTDIR)/home/xiaobiaozhao/bin/openresty/site/manifest
	ln -sf /home/xiaobiaozhao/bin/openresty/nginx/sbin/nginx $(DESTDIR)/home/xiaobiaozhao/bin/openresty/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
