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
calc: /* nothing */                      
 | calc exp EOL { printf("= %d\n", $2); }
 ;

exp: factor       
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term 
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUM 
 | EXPO term EXPC { $$ = $2; }
 | EXPO exp EXPC { $$ = $2; }
;
%%

int main(int argc, char **argv) {
    yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
