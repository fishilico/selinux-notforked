PYTHON ?= python

# Installation directories.
PREFIX ?= /usr
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
MANDIR ?= $(DESTDIR)$(PREFIX)/share/man

CFLAGS ?= -Werror -Wall -W

# If no specific libsepol.a is specified, fall back on LDFLAGS search path
# Otherwise, as $(LIBSEPOLA) already appears in the dependencies, there
# is no need to define a value for LDLIBS_LIBSEPOLA
ifeq ($(LIBSEPOLA),)
        LDLIBS_LIBSEPOLA := -l:libsepol.a
endif

all: audit2why sepolgen-ifgen-attr-helper

sepolgen-ifgen-attr-helper: sepolgen-ifgen-attr-helper.o $(LIBSEPOLA)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS_LIBSEPOLA)

audit2why:
	ln -sf audit2allow audit2why

test: all
	@$(PYTHON) test_audit2allow.py -v

install: all
	-mkdir -p $(BINDIR)
	install -m 755 audit2allow $(BINDIR)
	(cd $(BINDIR); ln -sf audit2allow audit2why)
	install -m 755 sepolgen-ifgen-attr-helper $(BINDIR)
	install -m 755 sepolgen-ifgen $(BINDIR)
	-mkdir -p $(MANDIR)/man1
	install -m 644 audit2allow.1 $(MANDIR)/man1/
	install -m 644 audit2why.1 $(MANDIR)/man1/

clean:
	rm -f *~ *.o sepolgen-ifgen-attr-helper

indent:
	../../scripts/Lindent $(wildcard *.[ch])

relabel: ;
