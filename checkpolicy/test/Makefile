#
# Makefile for building the dispol program
#
PREFIX ?= /usr
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
LIBDIR ?= $(DESTDIR)$(PREFIX)/lib

CFLAGS ?= -g -Wall -W -Werror -O2 -pipe

# If no specific libsepol.a is specified, fall back on LDFLAGS search path
# Otherwise, as $(LIBSEPOLA) already appears in the dependencies, there
# is no need to define a value for LDLIBS_LIBSEPOLA
ifeq ($(LIBSEPOLA),)
        LDLIBS_LIBSEPOLA := -l:libsepol.a
endif

all: dispol dismod

dispol: dispol.o $(LIBSEPOLA)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS_LIBSEPOLA)

dismod: dismod.o $(LIBSEPOLA)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS_LIBSEPOLA)

clean:
	-rm -f dispol dismod *.o 
