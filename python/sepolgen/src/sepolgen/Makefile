PREFIX ?= /usr
PYTHON ?= python
PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(prefix='$(PREFIX)'))")
PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)/sepolgen

all:

install: all
	-mkdir -p $(PACKAGEDIR)
	install -m 644 *.py $(PACKAGEDIR)
	$(PYTHON) -m compileall $(PACKAGEDIR)

clean:
	rm -f parser.out parsetab.py
	rm -f *~ *.pyc
	rm -rf __pycache__
