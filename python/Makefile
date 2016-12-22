SUBDIRS = sepolicy audit2allow semanage sepolgen chcat
# Do not test audit2allow as it requires a specific configuration
TEST_SUBDIRS = sepolicy semanage sepolgen chcat

all install relabel clean indent:
	@for subdir in $(SUBDIRS); do \
		(cd $$subdir && $(MAKE) $@) || exit 1; \
	done

test:
	@for subdir in $(TEST_SUBDIRS); do \
		(cd $$subdir && $(MAKE) $@) || exit 1; \
	done
