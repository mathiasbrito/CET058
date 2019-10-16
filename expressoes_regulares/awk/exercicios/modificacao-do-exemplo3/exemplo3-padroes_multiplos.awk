#!/usr/bin/awk -f
# Este programa não captura o último identificador na última expressão do
# arquivo de entrada em ./input/exemplo3-padroes-multiplos.in
# Modifique o programa para que ele identifique todos os identificadores


BEGIN { print "- INICIO - Iniciando Análise" }

    function print_token(token, value) {
        print "<"token",'"value"'>"
    }

    match($0,/[a-zA-Z_][a-zA-Z0-9]*/) {print_token("identificador",substr($0,RSTART,RLENGTH))}
    match($0,/=/) {print_token("atribuicao", substr($0,RSTART,RLENGTH))}
    match($0,/[0-9]+/) {print_token("inteiro",  substr($0,RSTART,RLENGTH))}

END { print " - FIM -" }
