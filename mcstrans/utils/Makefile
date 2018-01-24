# Installation directories.
PREFIX ?= /usr
LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin

CFLAGS ?= -Wall
override CFLAGS += -I../src -D_GNU_SOURCE
override LDLIBS += -lselinux -lpcre

TARGETS=transcon untranscon

# If no specific libsepol.a is specified, fall back on LDFLAGS search path
# Otherwise, as $(LIBSEPOLA) already appears in the dependencies, there
# is no need to define a value for LDLIBS_LIBSEPOLA
ifeq ($(LIBSEPOLA),)
        LDLIBS_LIBSEPOLA := -l:libsepol.a
endif

all: $(TARGETS)

transcon: transcon.o ../src/mcstrans.o ../src/mls_level.o $(LIBSEPOLA)
	$(CC) $(CFLAGS) -o $@ $^ -lpcre -lselinux $(LDLIBS_LIBSEPOLA)

untranscon: untranscon.o ../src/mcstrans.o ../src/mls_level.o $(LIBSEPOLA)
	$(CC) $(CFLAGS) -o $@ $^ -lpcre -lselinux $(LDLIBS_LIBSEPOLA)

install: all
	-mkdir -p $(SBINDIR)
	install -m 755 $(TARGETS) $(SBINDIR)

test:
	./mlstrans-test-runner.py ../test/*.test

clean:
	rm -f $(TARGETS) *.o *~ \#*

relabel:

