/* SEÇÃO DE DEFINIÇÕES */

%{
    #include "parser.tab.h"
%}

/* Definições de Nomes */
NUMBER              [0-9]+

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%

{NUMBER}                        {strncpy(yylval.simbolo, yytext, 50); return NUM;}
"\*"                            {return MUL;}   
"/"                             {return DIV;}
"\+"                            {return ADD;}   
"\-"                            {return SUB;} 
"\("                            {return APAR;}
"\)"                            {return FPAR;}
"\n"                            {return EOL;}
<<EOF>>                         {return 0;}

%%

int yywrap() {}
