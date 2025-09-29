hooksPath := $(git config --get core.hooksPath)

.PHONY: precommit
default: precommit

precommit:
ifneq ($(strip $(hooksPath)),.github/hooks)
	@git config --add core.hooksPath .github/hooks
endif
echo "1.2.3.4"