#!/bin/bash

cd ~/Documents/Learning/cursosalura/shell_script_I_II/imagens-livros

if [ ! -d png ]
then
   mkdir png
fi

for imagem in *.jpg
do
    imagem_sem_extensao=$(ls $imagem | mawk -F . '{print $1}')
    convert $imagem png/$imagem_sem_extensao.png
done
