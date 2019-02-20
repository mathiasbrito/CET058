#!/usr/bin/env awk -f
BEGIN { print "- INICIO - Iniciando Análise" }
  match($0,/[a-zA-z0-9]*/) {print substr($0,RSTART,RLENGTH)}
END { print " - FIM -" }
