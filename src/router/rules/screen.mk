screen-configure: ncurses
	cd screen && ./configure --host=$(ARCH)-linux --enable-colors256 CFLAGS="$(COPTS) $(MIPS16_OPT)  -ffunction-sections -fdata-sections -Wl,--gc-sections -DNEED_PRINTF -I$(TOP)/ncurses/include" LDFLAGS="-ffunction-sections -fdata-sections -Wl,--gc-sections -L$(TOP)/ncurses/lib" --prefix=/usr ac_cv_safe_to_define___extensions__=no

screen: ncurses
	make   -C screen

screen-clean:
	make   -C screen clean

screen-install:
	make   -C screen install DESTDIR=$(INSTALLDIR)/screen
	rm -rf $(INSTALLDIR)/screen/usr/share/man
	rm -rf $(INSTALLDIR)/screen/usr/share/info
	rm -rf $(INSTALLDIR)/screen/usr/lib

