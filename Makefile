compile: lexfile.l yaccfile.y
	flex lexfile.l
	yacc -d yaccfile.y

compile1:
	gcc lex.yy.c y.tab.c

run:
	./a.out