#!/bin/sh
# Run clang's static analyzer (scan-build)
cd "$(dirname -- "$0")" || exit $?

DESTDIR="$(pwd)/DESTDIR"
OUTPUTDIR="$(pwd)/output-scan-build"

if [ -e "$DESTDIR" ] ; then
    rm -f "$DESTDIR/usr/bin/newrole"
    rm -r "$DESTDIR"
fi

set -x -e
make CC=clang clean distclean
exec scan-build -o "$OUTPUTDIR" make CC=clang DESTDIR="$DESTDIR" install install-pywrap install-rubywrap
