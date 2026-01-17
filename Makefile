# Cursor Chat Recovery Tool - Makefile
# Works on macOS, Linux, and Windows (with make installed via Git Bash/MinGW)

SHELL := /bin/bash
SCRIPT := cursor-chat-recovery.sh
INSTALL_DIR := $(HOME)/.local/bin
INSTALL_NAME := cursor-chat-recovery

.PHONY: all install uninstall test lint help clean

all: help

help:
	@echo "Cursor Chat Recovery Tool"
	@echo ""
	@echo "Usage:"
	@echo "  make install    Install to ~/.local/bin"
	@echo "  make uninstall  Remove from ~/.local/bin"
	@echo "  make test       Run platform tests"
	@echo "  make lint       Run shellcheck (if installed)"
	@echo "  make check      Run all checks (test + lint)"
	@echo "  make clean      Remove temporary files"
	@echo ""

install:
	@echo "Installing $(SCRIPT) to $(INSTALL_DIR)/$(INSTALL_NAME)..."
	@mkdir -p "$(INSTALL_DIR)"
	@cp "$(SCRIPT)" "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@chmod +x "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@echo ""
	@if echo "$$PATH" | grep -q "$(INSTALL_DIR)"; then \
		echo "✅ Installed! Run: $(INSTALL_NAME) --help"; \
	else \
		echo "⚠️  $(INSTALL_DIR) is not in your PATH"; \
		echo ""; \
		echo "Add this to your shell profile (~/.bashrc, ~/.zshrc):"; \
		echo "  export PATH=\"\$$HOME/.local/bin:\$$PATH\""; \
		echo ""; \
		echo "Then run: source ~/.bashrc (or ~/.zshrc)"; \
	fi

uninstall:
	@echo "Removing $(INSTALL_DIR)/$(INSTALL_NAME)..."
	@rm -f "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@echo "✅ Uninstalled"

test:
	@echo "Running platform tests..."
	@echo ""
	@bash tests/test-platform.sh

lint:
	@if command -v shellcheck >/dev/null 2>&1; then \
		echo "Running shellcheck..."; \
		shellcheck $(SCRIPT) tests/test-platform.sh || true; \
		echo ""; \
	else \
		echo "⚠️  shellcheck not installed (optional)"; \
	fi

check: test
	@echo ""
	@echo "✅ All checks passed"

clean:
	@echo "Cleaning temporary files..."
	@find . -name "*.backup.*" -type f -delete 2>/dev/null || true
	@find . -name "*.tmp" -type f -delete 2>/dev/null || true
	@echo "✅ Clean"

# Version info
version:
	@bash $(SCRIPT) --version

