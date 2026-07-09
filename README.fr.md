# PBIcons

Dépôt personnel des images produites par Philippe Poilbarbe (PB) : surtout
des icônes utilisées dans les différents programmes qu'il développe, mais
aussi d'autres images pour ces programmes, pour son site web
([cardolan.net](https://www.cardolan.net)), et pour d'autres documents
comme des flyers. Les images stockées ici sont les versions originales, en
taille pleine ; elles peuvent être réutilisées ailleurs en tailles réduites.
Chaque image est stockée ici afin d'être réutilisée d'un projet à l'autre.

## Organisation du dépôt

| Répertoire  | Contenu                                                                        |
| ----------- | ------------------------------------------------------------------------------ |
| `actions/`  | Icônes utilisées pour les actions et boutons de barre d'outils des programmes. |
| `programs/` | Icônes et images représentant les programmes eux-mêmes.                        |
| `cardolan/` | Images utilisées sur le site web [cardolan.net](https://www.cardolan.net).     |
| `flyer/`    | Images utilisées dans des flyers et autres documents.                          |

## Contenu du dépôt

Pour chaque image, les fichiers suivants peuvent être présents :

| Fichier          | Description                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `xxx.png`        | La version pixel (matricielle) de l'image.                                                                                         |
| `xxx.svg`        | La version vectorielle de l'icône, dérivée du `.png`. Présente uniquement pour les icônes réellement utilisées par les programmes. |
| `xxx.prompt.txt` | Le prompt utilisé pour générer l'image avec l'IA générative.                                                                       |
| `xxx.md`         | Une courte description de l'image.                                                                                                 |

Chaque fichier `xxx.md` débute par un titre, suivi d'un lien vers l'image
`xxx.png` correspondante, puis d'une courte description.

## Processus de production

La plupart des images pixel (`.png`), sinon toutes, suivent ce processus :

1. **Génération** — l'image est créée avec un outil d'IA générative d'images, à partir du prompt stocké dans le fichier `.prompt.txt` correspondant, quand il existe.
2. **Retouche** — l'image générée est retravaillée avec GIMP, notamment pour ajouter ou corriger la transparence.
3. **Vectorisation** — pour les icônes réellement utilisées par les programmes, l'image pixel retravaillée est convertie en fichier vectoriel (`.svg`), qui est le format réellement utilisé dans les programmes cibles.

## Contribuer

Après avoir cloné ce dépôt, lancez `make setup` pour installer les hooks
pre-commit (espaces en fin de ligne, lint markdown, contrôle des gros
fichiers et de Git LFS, etc.) qui s'exécutent automatiquement avant
chaque commit.

## Projets utilisant ces images

Cette liste n'est pas exhaustive, mais les projets GitHub suivants utilisent des
images de ce dépôt :

- [PBCardolan](https://github.com/ppoilbarbe/PBCardolan)
- [PBPicat](https://github.com/ppoilbarbe/PBPicat)
- [PBPrompt](https://github.com/ppoilbarbe/PBPrompt)
- [PBRecipe](https://github.com/ppoilbarbe/PBRecipe)
- [PBRegisterActivity](https://github.com/ppoilbarbe/PBRegisterActivity)
- [PBRenamer](https://github.com/ppoilbarbe/PBRenamer)

## Crédits

- **Génération des images** : [Venice Studio](https://venice.ai/studio)
- **Conversion PNG → SVG** : [Perfect Vector](https://perfectvector.com)

## Licence

Toutes les icônes, ainsi que tout texte présent dans ce dépôt, sont sous
licence **CC BY-NC-SA** (Creative Commons Attribution - Pas d'Utilisation
Commerciale - Partage dans les Mêmes Conditions). Voir le fichier
[LICENSE](LICENSE) pour le détail.

## Copyright

© Marcel Spock — PBMou.

« PBMou » est un jeu de mots interlangue : « PB » pour Poilbarbe, et « Mou »
la traduction française de « Soft » — PBMou se lit donc comme « PBSoft »
à moitié traduit en français, dans l'esprit des jeux de mots franco-anglais
propres aux conventions de nommage de l'auteur.
