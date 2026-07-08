# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

Versions are numbered `AAAA.n` — the year of release, followed by a
sequential release number within that year (e.g. `2026.1`, `2026.2`, ...).

## [2026.1] - 2026-07-08

### Added

- Initial icon collection: `actions/` (application actions — file, edit,
  zoom, rotate, import/export, recipe-related icons, etc.) and `programs/`
  (application icons and branding assets).
- For each icon: the pixel source (`.png`), the vector version used by
  programs (`.svg`), the generative-AI prompt used to create it
  (`.prompt.txt`), and a short description (`.md`).
- `README.md` and its French counterpart `README.fr.md`, describing the
  repository's purpose, contents, and production workflow (generative AI →
  GIMP rework → SVG conversion).
- `LICENSE`: CC BY-NC-SA 4.0, covering both icons and text in this
  repository.
- `.pre-commit-config.yaml`: trailing-whitespace, end-of-file-fixer,
  check-yaml, check-toml, check-merge-conflict, check-added-large-files,
  and markdownlint-cli2 checks.
- `.github/workflows/ci.yml`: GitHub Actions workflow running the
  pre-commit hooks on every push and pull request.
