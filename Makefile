.PHONY: help

.DEFAULT_GOAL:=help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

CHART_TESTING_TAG ?= v2.0.1
TEST_IMAGE_TAG ?= v3.0.1

CHARTS_REPO ?= https://github.com/imio/charts

lint:  ## Lint the charts that have been changed
	$(eval export CHART_TESTING_TAG)
	$(eval export CHARTS_REPO)
	$(eval export CHART_TESTING_ARGS=${MAC_ARGS})
	test/lint-charts-local.sh

lint-all: ## Lint all available charts
	$(eval export CHART_TESTING_TAG)
	$(eval export CHARTS_REPO)
	$(eval export CHART_TESTING_ARGS=--all)
	test/lint-charts-local.sh

