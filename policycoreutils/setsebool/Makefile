# Installation directories.
PREFIX ?= /usr
SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
MANDIR = $(DESTDIR)$(PREFIX)/share/man
BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions

CFLAGS ?= -Werror -Wall -W
override LDLIBS += -lsepol -lselinux -lsemanage
SETSEBOOL_OBJS = setsebool.o

BASHCOMPLETIONS=setsebool-bash-completion.sh 

all: setsebool

setsebool: $(SETSEBOOL_OBJS)

install: all
	-mkdir -p $(SBINDIR)
	install -m 755 setsebool $(SBINDIR)
	-mkdir -p $(MANDIR)/man8
	install -m 644 setsebool.8 $(MANDIR)/man8/
	-mkdir -p $(BASHCOMPLETIONDIR)
	install -m 644 $(BASHCOMPLETIONS) $(BASHCOMPLETIONDIR)/setsebool

relabel:

clean:
	-rm -f setsebool *.o

indent:
	../../scripts/Lindent $(wildcard *.[ch])

