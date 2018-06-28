#!/bin/bash

converte_imagens() {
   cd ~/Documents/Learning/cursosalura/shell_script_I_II/imagens-livros

   if [ ! -d png ]
   then
      mkdir png
   fi

   for imagem in *.jpg
   do
      local imagem_sem_extensao=$(ls $imagem | mawk -F . '{print $1}')
      convert $imagem png/$imagem_sem_extensao.png
   done
}

converte_imagens 2> erros_conversao.log

if [ $? -eq 0 ]
then
   echo "Conversão realizada com sucesso!"
else
   echo "Ocorreu um problema na conversão!"
fi
