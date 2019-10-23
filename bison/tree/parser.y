%{

/* Código C, use para #include, variáveis globais e constantes
 * este código ser adicionado no início do arquivo fonte em C
 * que será gerado.
 */

#include <stdio.h>
#include <stdlib.h>


typedef struct No {
    char token[50];
    int num_filhos;
    struct No** filhos;
} No;


No* allocar_no();
void liberar_no(No* no);
void imprimir_arvore(No* raiz);
No* novo_no(char[50], No**, int);

%}

/* Declaração de Tokens no formato %token NOME_DO_TOKEN */
%union 
{
    int number;
    char simbolo[50];
    struct No* no;
}
%token NUM
%token ADD
%token SUB
%token MUL
%token DIV
%token APAR
%token FPAR
%token EOL

%type<no> calc
%type<no> termo
%type<no> fator
%type<no> exp
%type<simbolo> NUM
%type<simbolo> MUL
%type<simbolo> DIV
%type<simbolo> SUB
%type<simbolo> ADD


%%
/* Regras de Sintaxe */

calc:
    | calc exp EOL       { imprimir_arvore($2); } 

exp: fator               
   | exp ADD fator       { }
   | exp SUB fator       { }
   ;

fator: termo            
     | fator MUL termo  { }
     | fator DIV termo  { }
     ;

termo: NUM { $$ = novo_no($1, NULL, 0); }               
   

%%

/* Código C geral, será adicionado ao final do código fonte 
 * C gerado.
 */

No* allocar_no(int num_filhos) {
    return NULL;
}

void liberar_no(No* no) {
    free(no);
}

No* novo_no(char token[50], No** filhos, int num_filhos) {
   return NULL;
}

void imprimir_arvore(No* raiz) {
}


int main(int argc, char** argv) {
    yyparse();
}

yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}

