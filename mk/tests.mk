# Run program $1 as part of ‘make installcheck’.

test-deps =

define run-install-test

  .PHONY: $1.test
  $1.test: $1 $(test-deps)
	@env BASH=$(bash) $(bash) mk/run-test.sh $1 < /dev/null

  .PHONY: $1.test-debug
  $1.test-debug: $1 $(test-deps)
	@env BASH=$(bash) $(bash) mk/debug-test.sh $1 < /dev/null

endef

define run-install-test-group

  .PHONY: $1.test-group

endef

.PHONY: check installcheck

print-top-help += \
  echo "  check: Run unit tests"; \
  echo "  installcheck: Run functional tests";
