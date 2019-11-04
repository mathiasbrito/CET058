%{
    #include <stdio.h>
%}


%token EXPC
%token EXPO
%token NUM
%token ADD
%token SUB
%token MUL
%token DIV
%token ABS
%token EOL

%%
exp: /* nothing */                      
 | exp termo EOL { printf("= %d\n", $2); }
 ;

termo: fator       
 | termo ADD fator { $$ = $1 + $3; }
 | termo SUB fator { $$ = $1 - $3; }
 ;

fator: const
 | fator MUL const { $$ = $1 * $3; }
 | fator DIV const { $$ = $1 / $3; }
 ;

const: NUM 
 | EXPO termo EXPC { $$ = $2; }
 | EXPO fator EXPC { $$ = $2; }
;
%%

int main(int argc, char **argv) {
    yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
