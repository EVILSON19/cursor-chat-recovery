# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2026-01-17

### Added
- Exit option (`q`) at all interactive prompts
- Project path display in workspace listings (reads from `workspace.json`)
- Improved README with "Before & After" instructions
- Recovery instructions for wrong workspace restores

### Changed
- Simplified lint target (informational, non-blocking)
- Removed unnecessary comments

## [1.2.0] - 2026-01-17

### Added
- Cursor installation detection for all platforms
- Linux: Support for `$XDG_CONFIG_HOME` and `~/.cursor-server/` (remote/SSH)
- Makefile for standard commands (`make install`, `make test`, `make lint`)

### Changed
- Refactored to DRY principle: extracted `restore_workflow()` and `win_to_unix_path()`
- Moved tests to `tests/` directory
- Better error messages with platform-specific guidance

## [1.1.0] - 2026-01-17

### Added
- `--version`, `--list`, `--restore`, `--dry-run` command-line flags
- Non-interactive mode for scripting/automation
- Auto-detect project name from current directory
- GitHub Actions CI, issue templates, PR template
- `.gitignore` and `.editorconfig`

## [1.0.0] - 2026-01-16

### Added
- Initial release
- Cross-platform support (macOS, Linux, Windows/Git Bash)
- Project name filtering for workspace search
- Automatic backup creation before modifications
- Copy and merge functionality for chat history
- Interactive menu system
- Cursor process detection
