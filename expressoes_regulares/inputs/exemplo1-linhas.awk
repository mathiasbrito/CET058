#!/usr/bin/awk -f
BEGIN { print "- INICIO - Iniciando Análise" }
{ print $0 }
END { print " - FIM -" }
