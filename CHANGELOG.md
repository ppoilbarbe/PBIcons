# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

Versions are numbered `AAAA.n` — the year of release, followed by a
sequential release number within that year (e.g. `2026.1`, `2026.2`, ...).

## [2026.2] - 2026-07-09

### Added

- 20 new `actions/` icons, each with its pixel source (`.png`), vector
  version (`.svg`), and short description (`.md`): `add`, `calendar-day`,
  `calendar-journal`, `calendar-time-spent`, `calendar-timeline`,
  `calendar-work-week`, `cancel`, `edit`, `error`, `left`, `next`, `ok`,
  `piechart`, `previous`, `question`, `refresh-data`, `refresh`, `remove`,
  `right`, `warning`. Most of them also include the generative-AI prompt
  used to create them (`.prompt.txt`).
- `programs/pbregisteractivity.svg`, the vector version of the
  PBRegisterActivity program icon.

### Changed

- `LICENSE`: replaced the human-readable summary with the full legal text
  of the CC BY-NC-SA 4.0 license, so that GitHub's license detector
  recognizes it.
- Normalized the root `<svg>` element of several existing `actions/` icons
  (`auto-rotate`, `configure`, `delete`, `duplicate`, `folder-new`,
  `folder-open`, `help-about`, `help-keyboard-shortcuts`, `history`,
  `object-flip-vertical`, `object-rotate-left`, `object-rotate-right`,
  `open`, `open-with`, `preferences-system`, `quit`, `rename-template`,
  `reset-exif`, `view-refresh`, `zoom-fit`, `zoom-height`, `zoom-in`,
  `zoom-original`, `zoom-out`, `zoom-width`): replaced the
  `style="width: 100%; height: 100%;"` attribute with explicit
  `width="1024" height="1024"` attributes.

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
