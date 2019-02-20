#!/usr/bin/awk -f
BEGIN { print "- INICIO - Iniciando Análise" }
  {
      while(match($0,/[a-zA-Z][a-zA-Z0-9]*/)) {
          print "<identifier, "substr($0,RSTART,RLENGTH)" >"; 
          $0=substr($0,RSTART+RLENGTH);
      }
  }
END { print " - FIM - " }
