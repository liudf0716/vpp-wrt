SHELL := /usr/bin/env bash -o pipefail

help:
	@echo "List of make targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed 's/^[^:]*://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT = help

pre-install: ## prepare vpp and dpdk
	@echo "# prepare vpp and dpdk run environment"
	@modprob vfio-pci
	@echo Y > /sys/module/vfio/parameters/enable_unsafe_noiommu_mode
	@sysctl -p 80-vpp.conf
	
install-image: ## install vpp-wrt & etcd image
	@echo "# install vpp-wrt base and etcd image"
	chmod +x fetch-images.sh
	./fetch-images.sh

uninstall-image: ## uninstall all install and image
	@echo "# uninstall all image and its instance"
	chmod +x uninstall-images.sh
	./uninstall-images.sh

.PHONY: help \
	pre-install install-image \
	uninstall-image
