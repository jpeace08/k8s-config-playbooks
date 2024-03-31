.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

preflight-provision: ## Run ansible-playbook for config node
	ansible-playbook -k ./site.yml -i ./inventories/hosts.ini --tags config_node --ask-become-pass

postflight-provision: ## Run ansible-playbook for config kubectl after deploy k8s cluster
	ansible-playbook -k ./site.yml -i ./inventories/hosts.ini --tags config_kubectl --ask-become-pass

config-registry: ## Run absible-playbook for config private registry
	ansible-playbook -k ./site.yml -i ./inventories/hosts.ini --tags config_registry --ask-become-pass

config-nfs: ## Run ansible-playbook for config nfs server
	ansible-playbook -k ./site.yml -i ./inventories/hosts.ini --tags config_nfs --ask-become-pass
