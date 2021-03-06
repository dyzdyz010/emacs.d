all: help
.PHONY: all

## Generate init.el from README.org
generate:
	@echo "Generate init.el from README.org."
	emacs -Q --batch --find-file "README.org" -f "org-babel-tangle"
.PHONY: generate

## Clean build (straight/)
clean-build:
	rm -rf straight
.PHONY: clean-build

## Clean etc (etc/)
clean-etc:
	rm -rf etc
.PHONY: clean-etc

## Clean python (anaconda-mode/)
clean-python:
	rm -rf anaconda-mode
.PHONY: clean-python

## Clean var (var/)
clean-var:
	rm -rf var
.PHONY: clean-var

## clean all build etc python var
clean-all: clean clean-build clean-etc clean-python clean-var
.PHONY: clean-all

## Update config
update: clean-build
	git pull
.PHONY: update

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=20

## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\.\_0-9%]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
		  helpCommand = $$1; sub(/:$$/, "", helpCommand); \
		  helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
		  printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
.PHONY: help
