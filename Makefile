# Load environment variables from .env file
include main.env
export $(shell sed 's/=.*//' main.env)

# Build target
build:
	go build -ldflags "\
		-X main.hostname=$(HOSTNAME) \
		-X main.port=$(PORT) \
		-X main.username=$(USERNAME) \
		-X main.password=$(PASSWORD) \
		-X main.remotePath=$(REMOTE_PATH)" \
		-o screenshot_saver

# Clean target
clean:
	rm -f screenshot_saver

# Default target
.PHONY: build clean
.DEFAULT_GOAL := build
