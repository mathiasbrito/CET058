/*

- Para gerar o fonte digite
$ lex ex01.l

- Para compilar o fonte me C gerado digite
$ gcc ex01.yy.c

- Para executar
$ ./a.out

*/   


/* SEÇÃO DE DEFINIÇÕES */

%{
    /*
        Definições que estarão disponíveis 
            - variáveis
            - constantes
        O que for aqui será copiado para o arquivo *.yy.c
    
        Variáveis declaradas aqui estarão acessível nas funções yylex() e 
        main().
    */
    int contador = 0;
%}

/* Definições de Nomes */
IDENTIFICADOR   [_a-zA-Z][_a-zA-Z0-9]*  

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */
[0-9]+              {printf("<number, %s>", yytext);}
>|<|>=|<=|==|!=     {printf("<op_rel, %s>", yytext);}                                      
int|float           {printf("<plavra_reservada, %s>", yytext); contador++;}
{IDENTIFICADOR}     {printf("<identificador, %s>", yytext); contador++;}
\+                   {printf("<soma,>"); contador++;}
<<EOF>>             return 0;
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}
