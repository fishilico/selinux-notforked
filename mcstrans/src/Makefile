# Installation directories.
PREFIX ?= /usr
LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
SBINDIR ?= $(DESTDIR)/sbin
INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
SYSTEMDDIR ?= $(DESTDIR)$(PREFIX)/lib/systemd

# If no specific libsepol.a is specified, fall back on LDFLAGS search path
# Otherwise, as $(LIBSEPOLA) already appears in the dependencies, there
# is no need to define a value for LDLIBS_LIBSEPOLA
ifeq ($(LIBSEPOLA),)
        LDLIBS_LIBSEPOLA := -l:libsepol.a
endif

PROG_SRC=mcstrans.c  mcscolor.c  mcstransd.c  mls_level.c
PROG_OBJS= $(patsubst %.c,%.o,$(PROG_SRC))
PROG=mcstransd
INITSCRIPT=mcstrans
CFLAGS ?= -Wall -W -Wundef -Wmissing-noreturn -Wmissing-format-attribute
override CFLAGS += -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64

all: $(PROG)

$(PROG): $(PROG_OBJS) $(LIBSEPOLA)
	$(CC) $(LDFLAGS) -pie -o $@ $^ -lselinux -lcap -lpcre $(LDLIBS_LIBSEPOLA)

%.o:  %.c 
	$(CC) $(CFLAGS) -fPIE -c -o $@ $<

install: all
	test -d $(SBINDIR) || install -m 755 -d $(SBINDIR)
	install -m 755 $(PROG) $(SBINDIR)
	test -d $(INITDIR) || install -m 755 -d $(INITDIR)
	install -m 755 $(INITSCRIPT).init $(INITDIR)/$(INITSCRIPT)
	test -d $(SYSTEMDDIR)/system || install -m 755 -d $(SYSTEMDDIR)/system
	install -m 644 mcstrans.service $(SYSTEMDDIR)/system/

clean: 
	-rm -f $(OBJS) $(LOBJS) $(TARGET) $(PROG) $(PROG_OBJS) *~ \#*

