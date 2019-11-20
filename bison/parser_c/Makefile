compile: parser.y analisador.l
	bison -d parser.y
	flex analisador.l
	gcc -o parser.x parser.tab.c lex.yy.c -ll
