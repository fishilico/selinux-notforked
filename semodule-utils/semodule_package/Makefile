# Installation directories.
PREFIX ?= /usr
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
MANDIR ?= $(DESTDIR)$(PREFIX)/share/man

CFLAGS ?= -Werror -Wall -W
override LDLIBS += -lsepol

all: semodule_package semodule_unpackage

semodule_package:  semodule_package.o 

install: all
	-mkdir -p $(BINDIR)
	install -m 755 semodule_package $(BINDIR)
	install -m 755 semodule_unpackage $(BINDIR)
	test -d $(MANDIR)/man8 || install -m 755 -d $(MANDIR)/man8
	install -m 644 semodule_package.8 $(MANDIR)/man8/
	install -m 644 semodule_unpackage.8 $(MANDIR)/man8/

relabel:

clean:
	-rm -f semodule_package semodule_unpackage *.o

indent:
	../../scripts/Lindent $(wildcard *.[ch])

