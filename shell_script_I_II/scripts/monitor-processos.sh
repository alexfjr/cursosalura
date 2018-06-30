#!/bin/bash

if [ ! -d logs_processos ]
then
   mkdir logs
fi

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processos
do
   nome_processo=$(ps -p $pid -o comm=)
   echo -n $(date +%F,%H:%M:%S,) >> logs/$nome_processo.log
done

