#!/bin/bash

if [ ! -d logs ]
then
   mkdir logs
fi

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

gerar_logs() {
   for pid in $processos
   do
      nome_processo=$(ps -p $pid -o comm=)
      echo -n $(date +%F,%H:%M:%S,) >> logs/$nome_processo.log

      tamanho_processo=$(ps -p $pid -o size | grep [0-9])
      echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> logs/$nome_processo.log
   done
}

gerar_logs

if [ $? -eq 0 ]
then
   echo "Logs gerados com sucesso!"
else
   echo "Erro na geração dos logs!"
fi

