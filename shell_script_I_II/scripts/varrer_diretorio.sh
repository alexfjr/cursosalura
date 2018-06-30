#!/bin/bash

processa_arquivo() {
   echo arquivo encontrado: $1
}

varrer_diretorio() {
   echo Entrando no diretório: $1
   cd $1

   for arquivo in *
   do
      if [ -d $arquivo ]
      then
         varrer_diretorio $arquivo
      else
         processa_arquivo $arquivo
      fi
   done

   #voltando ao diretório anterior
   cd ..
}

dir=$1

if [ $# -eq 0 ]
then
   dir=.
fi

varrer_diretorio $dir

