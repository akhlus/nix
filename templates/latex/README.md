# LaTeX template

## Build PDF

To build a pdf output of the document run:

```sh
nix build
```

## Interactive watch mode

Get an Overleaf-esq setup by running:

```sh
nix develop
latexmk -interaction=nonstopmode -auxdir=.cache/latex -pdf -pvc main.tex
```

## Credits
Adapted from the mklatex template from https://github.com/NixOS/templates/
