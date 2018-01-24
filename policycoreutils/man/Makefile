# Installation directories.
PREFIX ?= /usr
MAN5DIR ?= $(DESTDIR)$(PREFIX)/share/man/man5

all:

clean:

install: all
	mkdir -p $(MAN5DIR)
	install -m 644 man5/*.5 $(MAN5DIR)

relabel:
