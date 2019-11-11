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

%type<no> termo
%type<no> fator
%type<no> exp
%type<no> const
%type<simbolo> NUM
%type<simbolo> MUL
%type<simbolo> DIV
%type<simbolo> SUB
%type<simbolo> ADD


%%
/* Regras de Sintaxe */

exp:
    | exp termo EOL       { 
                            imprimir_arvore($2) 
                          }
termo: fator               
   | termo ADD fator       { 
                            No** filhos = (No**) malloc(sizeof(No*)*3);
                            filhos[0] = $1;
                            filhos[1] = novo_no("+", NULL, 0);
                            filhos[2] = $3;
                            No* raiz_exp = novo_no("termo", filhos, 3); 
                            $$ = raiz_exp;
                         }
   | termo SUB fator       { 
                            No** filhos = (No**) malloc(sizeof(No*)*3);
                            filhos[0] = $1;
                            filhos[1] = novo_no("-", NULL, 0);
                            filhos[2] = $3;
                            No* raiz_exp = novo_no("termo", filhos, 3); 
                            $$ = raiz_exp;
                        }
   ;

fator: const            
     | fator MUL const  { 
                            No** filhos = (No**) malloc(sizeof(No*)*3);
                            filhos[0] = $1;
                            filhos[1] = novo_no("*", NULL, 0);
                            filhos[2] = $3;
                            No* raiz_termo = novo_no("fator", filhos, 3); 
                            $$ = raiz_termo;
                        }
     | fator DIV const  {  
                            No** filhos = (No**) malloc(sizeof(No*)*3);
                            filhos[0] = $1;
                            filhos[1] = novo_no("/", NULL, 0);
                            filhos[2] = $3;
                            No* raiz_termo = novo_no("fator", filhos, 3); 
                            $$ = raiz_termo;
                        }
     ;

const: NUM { $$ = novo_no($1, NULL, 0); }               
   

%%

/* Código C geral, será adicionado ao final do código fonte 
 * C gerado.
 */

No* allocar_no(int num_filhos) {
    No* no = (No*) malloc(sizeof(No));
    no->num_filhos = num_filhos;
    if (no->num_filhos == 0) {
        no->filhos = NULL;
    }

    return no;
    
}

void liberar_no(No* no) {
    free(no);
}

No* novo_no(char token[50], No** filhos, int num_filhos) {
   No* no = allocar_no(num_filhos);
   no->filhos = filhos;
   snprintf(no->token, 50, "%s", token);

   return no;
}

void imprimir_arvore(No* raiz) {
    if(raiz->filhos != NULL) {
        printf("[%s", raiz->token);
        for(int i = 0; i < raiz->num_filhos; i++) {
            imprimir_arvore(raiz->filhos[i]);
        }
        printf("]");
    }
    else {
        printf("[%s]", raiz->token);
    }
}


int main(int argc, char** argv) {
    yyparse();
}

yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}

