
%{                                            
     #include<stdio.h>
     #include<string.h>
    #include "y.tab.h"
    extern YYSTYPE yylval;
 
%}
%option yylineno

alpha [a-zA-Z]
digit [0-9]

%%

"#include <stdio.h>" return BEG;
"int main(){" return MAIN;
"return" return RETURN;

"printf" return PRINT;
"scanf" return SCAN;

"%d" { strcpy(yylval.code,yytext); return TYPE; }
"%f" { strcpy(yylval.code,yytext); return TYPE; }
"%c" { strcpy(yylval.code,yytext); return TYPE; }

"int" { strcpy(yylval.code,yytext); return DATATYPE; }
"float" {strcpy(yylval.code,yytext);  return DATATYPE;}
"char" { strcpy(yylval.code,yytext); return DATATYPE; }
"double" { strcpy(yylval.code,yytext); return DATATYPE; }



"if" return IF;
"else" return ELSE;
"while" return WHILE;
"for" return FOR;
"do" return DO;
"\"" return QUOTE;


"(" return OPEN;
"{" return COPEN;


{alpha}({alpha}|{digit})*  {strcpy(yylval.code,yytext); return VAR; }
[0-9]+ { strcpy(yylval.code,yytext); return NUM; }


"true" { strcpy(yylval.code,yytext); return BOOL; }
"false" { strcpy(yylval.code,yytext); return BOOL; }
"<=" { strcpy(yylval.code,yytext); return RELOP;}
">=" { strcpy(yylval.code,yytext); return RELOP; }
"==" { strcpy(yylval.code,yytext); return RELOP; }
"!=" { strcpy(yylval.code,yytext); return RELOP; }
"<" { strcpy(yylval.code,yytext); return RELOP; }
">" { strcpy(yylval.code,yytext); return RELOP; }
"&&" { strcpy(yylval.code,yytext); return LOGOP; }
"||" { strcpy(yylval.code,yytext); return LOGOP; }
"+" { strcpy(yylval.code,yytext); return AS; }
"-" { strcpy(yylval.code,yytext); return AS; }
"*" { strcpy(yylval.code,yytext); return MD; }
"/" { strcpy(yylval.code,yytext); return MD; }
"=" { strcpy(yylval.code,yytext); return Q; }


")" return CLOSE;
"}" return CCLOSE;
";" return SEMI;
"," return COMMA;
"&" return ADDR;


"\n" ;
. ;

%%


