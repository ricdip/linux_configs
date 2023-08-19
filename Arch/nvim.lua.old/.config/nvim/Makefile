.DEFAULT_GOAL := help

.SILENT: help
.PHONY: help # Display this help message
help:
	@grep -E '^.PHONY:.+#.+' Makefile | sed 's/.PHONY: //' | awk -F ' # ' '{printf "%-15s %s\n", $$1, $$2}'

.PHONY: format # Format .lua files
format:
	fd --type f -e lua | xargs lua-format -i -v
