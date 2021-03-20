.PHONY: all install clean

all:
	cd /root/openresty-1.19.3.1/build/LuaJIT-2.1-20201027 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/root/bin/luajit
	cd /root/openresty-1.19.3.1/build/lua-cjson-2.1.0.8 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/root/bin/lualib LUA_MODULE_DIR=/root/bin/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /root/openresty-1.19.3.1/build/lua-resty-signal-0.02 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/nginx-1.19.3 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/root/bin/
	-cp /root/openresty-1.19.3.1/COPYRIGHT $(DESTDIR)/root/bin/
	cd /root/openresty-1.19.3.1/build/LuaJIT-2.1-20201027 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/root/bin/luajit DESTDIR=$(DESTDIR)
	cd /root/openresty-1.19.3.1/build/lua-cjson-2.1.0.8 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/root/bin/lualib LUA_MODULE_DIR=/root/bin/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /root/openresty-1.19.3.1/build/lua-resty-signal-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.19.3.1/build/luajit-root/root/bin/luajit/include/luajit-2.1 LUA_LIB_DIR=/root/bin/lualib CC=cc
	cd /root/openresty-1.19.3.1/build/lua-resty-dns-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-memcached-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-redis-0.29 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-mysql-0.23 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-string-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-websocket-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-lock-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-lrucache-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-core-0.1.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-upstream-healthcheck-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-limit-traffic-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-resty-shell-0.03 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/lua-tablepool-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/root/bin/lualib INSTALL=/root/openresty-1.19.3.1/build/install
	cd /root/openresty-1.19.3.1/build/opm-0.0.5 && /root/openresty-1.19.3.1/build/install bin/* $(DESTDIR)/root/bin/bin/
	cd /root/openresty-1.19.3.1/build/resty-cli-0.27 && /root/openresty-1.19.3.1/build/install bin/* $(DESTDIR)/root/bin/bin/
	cp /root/openresty-1.19.3.1/build/resty.index $(DESTDIR)/root/bin/
	cp -r /root/openresty-1.19.3.1/build/pod $(DESTDIR)/root/bin/
	cd /root/openresty-1.19.3.1/build/nginx-1.19.3 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/root/bin/site/lualib $(DESTDIR)/root/bin/site/pod $(DESTDIR)/root/bin/site/manifest
	ln -sf /root/bin/nginx/sbin/nginx $(DESTDIR)/root/bin/bin/openresty

clean:
	rm -rf build *.exe *.dll openresty-*
