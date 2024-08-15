host ?= 0.0.0.0
port ?= 8000
lint-dir ?= .

.PHONY: help
help: ## Generates a help README
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: lint
lint: ## lint and format code with Ruff
	ruff check $(lint-dir) --fix ; ruff format $(lint-dir)

.PHONY: test
test: ## run tests with Pytest
	pytest .

.PHONY: serve
serve: ## run app with Uvicorn
	uvicorn app:app --host $(host) --port $(port) --reload

.PHONY: build
build: ## build app image (use with sudo)
	docker build . --tag finance_backend

.PHONY: run
run: ## run app container (use with sudo)
	docker run -d -p $(port):$(port) --name finance_backend finance_backend

.PHONY: stop
stop: ## stop docker container (use with sudo)
	docker stop finance_backend

.PHONY: init
init: ## init env and install dependencies
	pyenv install 3.12.4 || true
	pyenv local 3.12.4
	poetry install
	poetry shell
