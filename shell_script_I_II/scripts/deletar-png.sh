#!/bin/bash

varrer_diretorio() {
   cd $1

   for arquivo in *
   do
      if [ -d $arquivo ]
      then
         varrer_diretorio $arquivo
      else
	      local extensao=$(ls $arquivo | mawk -F . '{print $2}')
         local ext=png
         if [ $extensao = $ext ]
         then
            rm $arquivo
         fi
      fi
   done

   cd ..
}

varrer_diretorio ~/Documents/Learning/cursosalura/shell_script_I_II/imagens-novos-livros

if [ $? -eq 0 ]
then
    echo "Exclusão realizada com sucesso!"
else
    echo "Houve uma falha no processo de exclusão!"
fi
