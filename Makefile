.DEFAULT_GOAL := help

run: 		## Run the server
	@echo "Running the server"
	docker-compose up

build: 		## Build and run the server
	@echo "Building and running the server"
	docker-compose up --build

lint: 		## Lint the files
	@echo "Linting files using revive"
	@revive -config ./revive.toml -formatter stylish ./...

clean:		## Clean the project
	@echo "Cleaning the project"
	docker-compose down

help:		## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-30s %s\n", $$1, $$2}'
