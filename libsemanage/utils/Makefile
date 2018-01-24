# Installation directories.
PREFIX ?= /usr
LIBEXECDIR ?= $(DESTDIR)$(PREFIX)/libexec
SELINUXEXECDIR ?= $(LIBEXECDIR)/selinux/

all:

install: all
	-mkdir -p $(SELINUXEXECDIR)
	install -m 755 semanage_migrate_store $(SELINUXEXECDIR)

clean:

distclean: clean

indent:

relabel:

