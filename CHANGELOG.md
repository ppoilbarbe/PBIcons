# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

Versions are numbered `AAAA.n` — the year of release, followed by a
sequential release number within that year (e.g. `2026.1`, `2026.2`, ...).

## [Unreleased]

### Added

- Action icons: `clear`, `delete-ask`, `delete-noask`, `renumber`, `undo`,
  `view-close`, `view-stop` (SVG source and PNG).
- Program icons: `pbill` and `pbill-android` (SVG source and PNG).

### Fixed

- `make setup` now installs the Git LFS hooks before the pre-commit ones,
  so that pre-commit chains them and LFS objects are uploaded on push.
- `README.fr.md` synced with `README.md` (production workflow), with French
  non-breaking spaces applied throughout.

## [2026.1] - 2026-10-18

### Added

- Initial icon/images collection
- Old project history cleaned (to remove unused big images).
