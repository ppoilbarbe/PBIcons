# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

Versions are numbered `AAAA.n` — the year of release, followed by a
sequential release number within that year (e.g. `2026.1`, `2026.2`, ...).

## [2026.1] - 2026-07-09

### Added

- Initial icon collection: `actions/` (application actions — file, edit,
  zoom, rotate, import/export, recipe-related icons, etc.) and `programs/`
  (application icons and branding assets).
- For each icon: the pixel source (`.png`), the vector version used by
  programs (`.svg`), the generative-AI prompt used to create it
  (`.prompt.txt`), and a short description (`.md`).
- `cardolan/` directory: images used on the [cardolan.net](https://www.cardolan.net)
  website (Sindarin Tengwar banners, hobbit-home illustrations, and the
  Cardolan icon).
- `flyer/` directory: images used in flyers and other documents (`42`,
  `marvin`, `vogon`, `vogon-poetry`).
- `programs/pbregisteractivity.png` and its 128×128 variant, the icon for
  the PBRegisterActivity program.
- Git LFS configuration (`.gitattributes`): all `.png`/`.jpg`/`.jpeg` files,
  present and future, plus the large `.svg` files (over 100 KB), are stored
  through Git LFS.
- `README.md` and its French counterpart `README.fr.md`, describing the
  repository's purpose, layout (`actions/`, `programs/`, `cardolan/`,
  `flyer/`), contents, and production workflow (generative AI → GIMP
  rework → SVG conversion). Both also note that images are stored at their
  original size and may be reused elsewhere at reduced sizes, and list
  (non-exhaustively) the GitHub projects using these images: PBCardolan,
  PBPicat, PBPrompt, PBRecipe, PBRegisterActivity, PBRenamer.
- `LICENSE`: CC BY-NC-SA 4.0, covering both icons and text in this
  repository.
- `.pre-commit-config.yaml`: trailing-whitespace, end-of-file-fixer,
  check-yaml, check-toml, check-merge-conflict, check-added-large-files,
  markdownlint-cli2, and a local `check-large-svg-lfs` hook
  (`scripts/check-lfs-svg.sh`) that fails if a `.svg` file over 100 KB is
  not tracked by Git LFS.
- `.github/workflows/ci.yml`: GitHub Actions workflow running the
  pre-commit hooks on every push and pull request.
- `Makefile` with a `setup` target to install the pre-commit hooks after
  cloning the repository, documented in a new "Contributing" section of
  `README.md` / `README.fr.md`.
