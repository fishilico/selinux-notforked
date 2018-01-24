PYTHON ?= python

# Installation directories.
PREFIX ?= /usr
SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
MANDIR = $(DESTDIR)$(PREFIX)/share/man
PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)
BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions

TARGETS=semanage

BASHCOMPLETIONS=semanage-bash-completion.sh 

all: $(TARGETS)

install: all
	[ -d $(MANDIR)/man8 ] || mkdir -p $(MANDIR)/man8
	-mkdir -p $(SBINDIR)
	install -m 755 semanage $(SBINDIR)
	install -m 644 *.8 $(MANDIR)/man8
	test -d $(PACKAGEDIR) || install -m 755 -d $(PACKAGEDIR)
	install -m 755 seobject.py $(PACKAGEDIR)
	-mkdir -p $(BASHCOMPLETIONDIR)
	install -m 644 $(BASHCOMPLETIONS) $(BASHCOMPLETIONDIR)/semanage

test:
	@$(PYTHON) test-semanage.py -a
clean:

indent:

relabel:
