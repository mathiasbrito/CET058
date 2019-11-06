%{
    #include <stdio.h>
    #include <string.h>

    #define STR_SIZE 1024
%}

%union 
{
    int number;
    char string[1024];
}
%token EXPC
%token EXPO
%token NUM
%token ADD
%token SUB
%token MUL
%token DIV
%token ABS
%token EOL

%type<string> termo
%type<string> const
%type<string> fator
%type<string> exp
%type<string> NUM
%type<string> MUL
%type<string> DIV
%type<string> SUB
%type<string> ADD

%%
exp: /* nothing */                      
 | exp termo EOL { printf("%s\n", $2); }
 ;

termo: fator       
 | termo ADD fator { 
        char str[STR_SIZE];
        snprintf(str, STR_SIZE, "[ADD %s %s]", $1, $3);
        strncpy($$, str, STR_SIZE)
    }
 | termo SUB fator {
        char str[STR_SIZE];
        snprintf(str, STR_SIZE, "[SUB %s %s]", $1, $3);
        strncpy($$, str, STR_SIZE)
    }
 ;

fator: const
 | fator MUL const {
        char str[STR_SIZE];
        snprintf(str, STR_SIZE, "[MUL %s %s]", $1, $3);
        strncpy($$, str, STR_SIZE)
   }
 | fator DIV const { 
        char str[STR_SIZE]; 
        snprintf(str, STR_SIZE, "[DIV %s %s]", $1, $3);
        strncpy($$, str, STR_SIZE)
   }
 ;

const: NUM {
        char str[STR_SIZE];
        snprintf(str, STR_SIZE, "[%s]", $1); 
        strncpy($$, str, STR_SIZE)
    } 
 ;
%%

int main(int argc, char **argv) {
    yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
