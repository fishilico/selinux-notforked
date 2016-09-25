#!/bin/bash
# Set-up environment variables to run programs which are built in DESTDIR folder
# Usage:
#   $ ./run_afl.sh build-quick
#   $ . ./env_afl.sh
# or:
#   $ ./env_afl.sh secilc...

# Force every commands to succeed
set -e

export DESTDIR="${DESTDIR:-$(cd "$(dirname -- "$0")" && pwd)/DESTDIR}"
export CFLAGS="-I$DESTDIR/usr/include"
export LD_LIBRARY_PATH="$DESTDIR/usr/lib:$DESTDIR/lib"
export PATH="$DESTDIR/usr/sbin:$DESTDIR/usr/bin:$DESTDIR/sbin:$DESTDIR/bin:$PATH"
if [ -n "$VIRTUAL_ENV" ] ; then
    # Python virtualenvs do not support "import site; print(site.getsitepackages()[0]"
    # cf. https://github.com/pypa/virtualenv/issues/355#issuecomment-10250452
    export PYTHONPATH="$DESTDIR/usr/lib/$(${PYTHON:-python} -c 'import sys;print("python%d.%d" % sys.version_info[:2])')/site-packages"
else
    export PYTHONPATH="$DESTDIR/$(${PYTHON:-python} -c 'import site; print(site.getsitepackages()[0])')"
fi
export RUBYLIB="$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorlibdir"]'):$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorarchdir"]')"

# Unset -e if the file has been sourced in a shell
set +e

if [ $# -gt 0 ] ; then
    exec "$@"
fi
