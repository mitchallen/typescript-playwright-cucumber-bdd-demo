PORT ?= 8000

# Help screen
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  test-cucumber    Run cucumber tests"
	@echo "  test-playwright  Run playwright tests"
	@echo "  test             Run all tests"
	@echo "  serve           Start HTTP server on port $(PORT)"
	@echo "  list-port       List processes using port $(PORT)"
	@echo "  kill-port       Kill processes using port $(PORT)"
	@echo "  help           Show this help screen"

test-cucumber:
	@npm test

test-playwright:
	@npx playwright test

test: test-cucumber test-playwright
	@echo "Testing everything"

serve:
	@echo "Starting HTTP server on port $(PORT)"
	@python3 -m http.server $(PORT)

list-port:
	@lsof -i tcp:$(PORT) || echo "Port $(PORT) not found"

kill-port:
	@lsof -t -i tcp:$(PORT) | xargs kill || true

.PHONY: help

