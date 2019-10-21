#!/usr/bin/awk -f
BEGIN { print "- INICIO - Iniciando Análise" }

    function print_token(token, value) {
        print "<"token",'"value"'>"
    }

    match($0,/[a-zA-Z_][a-zA-Z0-9]*/) {print_token("identificador",substr($0,RSTART,RLENGTH))}
    match($0,/=/) {print_token("atribuicao", substr($0,RSTART,RLENGTH))}
    match($0,/[0-9]+/) {print_token("inteiro",  substr($0,RSTART,RLENGTH))}

END { print " - FIM -" }
