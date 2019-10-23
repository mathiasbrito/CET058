/* SEÇÃO DE DEFINIÇÕES */

%{
    #include "parser.tab.h"
%}

/* Definições de Nomes */
NUMBER              [0-9]+

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%

{NUMBER}                        {yylval = atoi(yytext); return NUM;}
"\*"                            {return MUL;}   
"/"                             {return DIV;}
"\+"                            {return ADD;}   
"\-"                            {return SUB;} 
"\("                            {return EXPO;}
"\)"                            {return EXPC;}
"\n"                            {return EOL;}
<<EOF>>                         {return 0;}

%%

int yywrap() {}
