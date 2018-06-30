#!/bin/bash

convert_jpg_png() {
   local imagem_sem_extensao=$(ls $1 | mawk -F . '{print $1}')

   convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio() {
   cd $1

   for arquivo in *
   do
      if [ -d $arquivo ]
      then
         varrer_diretorio $arquivo
      else
         convert_jpg_png $arquivo
      fi
   done

   cd ..
}

varrer_diretorio ~/Documents/Learning/cursosalura/shell_script_I_II/imagens-novos-livros

if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso!"
else
    echo "Houve uma falha no processo de conversão!"
fi
