# PBIcons

A personal repository of images produced by Philippe Poilbarbe (PB): mostly
icons used across the various programs he develops, but also other images
for those programs, for his website ([cardolan.net](https://www.cardolan.net)),
and for other documents such as flyers. The images stored here are the
original, full-size versions; they may be reused elsewhere at reduced
sizes. Each image is stored here so it can be reused across projects.

## Repository layout

| Directory   | Contents                                                             |
| ----------- | -------------------------------------------------------------------- |
| `actions/`  | Icons used for program actions and toolbar buttons.                  |
| `programs/` | Icons and images representing the programs themselves.               |
| `cardolan/` | Images used on the [cardolan.net](https://www.cardolan.net) website. |
| `flyer/`    | Images used in flyers and other documents.                           |

## Repository contents

For each image, the following files may be present:

| File             | Description                                                                                                    |
| ---------------- | -------------------------------------------------------------------------------------------------------------- |
| `xxx.png`        | The pixel (raster) version of the image.                                                                       |
| `xxx.svg`        | The vector version of the icon, derived from the `.png`. Only present for icons actually used by the programs. |
| `xxx.prompt.txt` | The prompt used to generate the image with generative AI.                                                      |
| `xxx.md`         | A short description of the image.                                                                              |

Each `xxx.md` file starts with a title, followed by a link to the matching
`xxx.png` image, then a short description.

## Production workflow

Most (if not all) pixel images (`.png`) follow this process:

1. **Generation** — the image is created with a generative AI image tool, from the prompt stored in the matching `.prompt.txt` file, when present.
2. **Rework** — the generated image is touched up in GIMP, in particular to add or fix transparency.
3. **Vectorization** — for icons actually used by the programs, the reworked pixel image is converted into a vector file (`.svg`), which is the format actually used in the target programs.

## Projects using these images

This is not an exhaustive list, but the following GitHub projects, all
under [github.com/ppoilbarbe](https://github.com/ppoilbarbe), use images
from this repository:

- [PBCardolan](https://github.com/ppoilbarbe/PBCardolan)
- [PBPicat](https://github.com/ppoilbarbe/PBPicat)
- [PBPrompt](https://github.com/ppoilbarbe/PBPrompt)
- [PBRecipe](https://github.com/ppoilbarbe/PBRecipe)
- [PBRegisterActivity](https://github.com/ppoilbarbe/PBRegisterActivity)
- [PBRenamer](https://github.com/ppoilbarbe/PBRenamer)

## Credits

- **Image generation**: [Venice Studio](https://venice.ai/studio)
- **PNG → SVG conversion**: [Perfect Vector](https://perfectvector.com)

## License

All icons, and all text present in this repository, are licensed under
**CC BY-NC-SA** (Creative Commons Attribution-NonCommercial-ShareAlike). See
the [LICENSE](LICENSE) file for details.

## Copyright

© Marcel Spock — PBMou.

"PBMou" is a bilingual pun: "PB" stands for Poilbarbe, and "Mou" is the
French translation of "Soft" — so PBMou reads as "PBSoft" translated
halfway into French, a French/English wordplay typical of the author's
naming conventions.
