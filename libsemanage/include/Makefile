# Installation directories.
PREFIX ?= /usr
INCDIR ?= $(DESTDIR)$(PREFIX)/include/semanage

all:

install: all
	test -d $(INCDIR) || install -m 755 -d $(INCDIR)
	install -m 644 $(wildcard semanage/*.h) $(INCDIR)

indent:
	../../scripts/Lindent $(wildcard semanage/*.h)
