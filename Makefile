SHELL := /usr/bin/env bash -o pipefail

help:
	@echo "List of make targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed 's/^[^:]*://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT = help

install-image: # install vpp-wrt & etcd image
  @echo "# install vpp-wrt base and etcd image"
  ./fetch_image.sh

.PHONY: help \
	install-image
