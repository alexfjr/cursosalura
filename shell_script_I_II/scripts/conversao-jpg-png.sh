#!/bin/bash

cd ~/Documents/Learning/cursosalura/shell_script_I_II/imagens-livros

for imagem in *.jpg
do
    convert $imagem $imagem.png
done
