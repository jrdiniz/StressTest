#!/bin/bash
#
# StressTest.sh
#
# Documentacao:
# Autor: Juliano Resende
# E-mail: juliano.resende@corp.terra.com.br
#
# Descricao do Script
# ------------------------------------
#
# - 
#
# Historico de Mudancas
#
# v0.1 - 16/01/2014, Juliano Resende
#       - Codificacao inicial
#
#### Inicio do Script ####

# Timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M")

# Numero de usuarios concorrentes
CONCURRENT=10

# Numero de repeticoes com base no numero de usuarios (REPETION * CONCURRENT)
REPETION=1

# Intervalo em segundos de cada acesso
DELAY=10

# Tempo de duracao do teste (1M = 1 minutos, 1H = 1 hora, 60s = 60 segundos)
TIME=1M

# Arquivo de log do teste
LOG=logs/logs_$TIMESTAMP.log

# Relatorio HTML
HTML=report/report_$TIMESTAMP.html

# URL do da aplicacao a ser testada
URL=http://superlutas-tmp.terra.com.br

touch $LOG
siege -c$CONCURRENT -d$DELAY -r$REPETION -l$LOG -v $URL

cp report.html $HTML

# Criacao do Relatorio
sed -i "s/URL/$URL/g" $HTML
