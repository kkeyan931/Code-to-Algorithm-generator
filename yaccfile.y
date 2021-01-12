%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int yylex();

int i=0,j,g;
char sym[100][100];
char str[100];
char* align(char str);
void yyerror(const char *s);
char ints[]={'%','d','\0'};
char floats[]={'%','f','\0'};
char chars[]={'%','c','\0'};
char doubles[]={'%','l','d','\0'};
char name[100];

void update(char s[20])
{
  strcpy(sym[i],s);
  i++;
}


int check(char s[20])
{
  int flag=0;
  for(j=0;j<i;j++)
  {
  if(!strcmp(sym[j],s))
    flag=1;
  }
    return flag;
}


void getspec(char s[20])
{

  if(!strcmp(s,ints))
    strcpy(str,"int");
  else if(!strcmp(s,floats))
    strcpy(str,"float");
  else if(!strcmp(s,chars))
    strcpy(str,"char");
  else if(!strcmp(s,doubles))
    strcpy(str,"double");

}

%}


%union{
char code[100];
}


%token BEG PRINT SCAN COMMA OPEN CLOSE IF ELSE WHILE RETURN MAIN SEMI COPEN CCLOSE ADDR DO
%token  FOR QUOTE
%token<code> VAR NUM
%token<code> DATATYPE TYPE
%token<code> RELOP LOGOP BOOL
%token<code> MD AS Q

%%

START :  BEG {printf("BIGIN\n");} CODE CCLOSE { printf("END\n"); exit(0); }
      ;      
CODE :MAIN {printf("MAIN\n");}
     | STMT  {printf("\n");}
     | CODE STMT {printf("\n");}
     | ST
     | CODE ST
     ;


STMT : EXPR
     | INIT	
     | DATA
     ;

ST   : IF {printf("\nIF ");} OPEN CON {printf("\nTHEN\n");} CLOSE COPEN CODE CCLOSE {printf("END IF\n\n");} 
     | ST ELSE {printf("ELSE\n");} COPEN CODE CCLOSE {printf("END ELSE\n");}
     | WHILE{printf("\nWHILE ");} OPEN EXPR {printf("\nTHEN\n");} CLOSE COPEN CODE CCLOSE {printf("END WHILE\n\n");}
     | DO COPEN{printf("\nREPEAT\n");} CODE CCLOSE WHILE OPEN {printf("UNTILL ");} CON CLOSE SEMI {printf("\nEND WHILE\n\n");}
     | DATATYPE VAR OPEN {printf("\nSTART_PROCEDURE %s (",$2); } parameter_list CLOSE {printf(")\n");} COPEN CODE CCLOSE {printf("END_PROCEDURE\n\n");} CODE 
     | FOR {printf("FOR ");} FORIN COPEN CODE CCLOSE {printf("END FOR\n\n");}
     | RETURN VAR SEMI {printf("\nRETURN %s\n",$2);}
     | RETURN NUM SEMI {printf("\nRETURN %s\n",$2);}
     | VAR OPEN {printf("CALL %s PASS ",$1);} PASS CLOSE SEMI
     | PR
     | SC
     ;	

PASS : VAR {printf("%s ",$1);} PASS 
     | ADDR VAR {printf("%s ",$2);} PASS
     | COMMA
     |
     ;

parameter_list: DATATYPE VAR {printf("%s %s",$2,$1);}
               | parameter_list COMMA DATATYPE VAR {printf(",%s %s",$4,$3);}

EXPR : E RELOP{printf("%s",$2); } E
     | E LOGOP{printf("%s",$2); } E  
     | E		
     ;

E : E AS{printf("%s",$2);} T  
  | T
  ;	

T : T MD{printf("%s",$2);} F    
  | F 
  ;

F : VAR {printf("%s",$1);} 
  | NUM	{printf("%s",$1);} 
  | OPEN E CLOSE
  ;

N : VAR {printf("%s\n",$1);} N QUOTE
  //| TYPE COMMA VAR {printf("%s",$3);}
  | N TYPE N QUOTE COMMA VAR {getspec($2); printf("%s %s\n",str,$6);} 
  |
  ;

//DEC :OPEN CON CLOSE;
  
DATA : DATATYPE VAR SEMI { update($2); printf("ASSIGN ( %s %s)",$2,$1);}
      | DATATYPE VAR COMMA {update($2);printf("%s %s,",$1,$2);} DATA
      ;


INIT :VAR Q NUM SEMI{printf("ASSIGN %s TO %s",$3,$1);}
     | VAR Q VAR SEMI{ printf("%s = %s",$2,$3); }
     //| VAR FROM NUM TO NUM {if($3<$5){printf("%s = %s ; %s <= %s ; %s ++)",$1,$3,$1,$5,$1);}else{printf("%s = %s ; %s >= %s ; %s --)",$1,$3,$1,$5,$1);}}
     | VAR Q{printf("%s %s",$1,$2);} E SEMI
     ;

FORIN : OPEN FORINIT CONFOR INC CLOSE

FORINIT : VAR Q VAR SEMI {printf("%s FROM %s ",$1,$3);}
        | VAR Q NUM SEMI {printf("%s FROM %s ",$1,$3);}

CONFOR : VAR RELOP VAR SEMI {printf("TO %s\nREPEAT\n",$3);}
       | VAR RELOP NUM SEMI {printf("TO %s\nREPEAT\n",$3);}

INC : NUM AS AS
    | VAR AS AS



PR : PRINT DATATYPE COMMA VAR {g=check($4); getspec($2); if(g==1)printf("printf(\"%s\",%s);\n",str,$4); else exit(0); }
   | PRINT {printf("PRINT ");} OPEN QUOTE N CLOSE SEMI
   //| PRINT OPEN QUOTE TYPE QUOTE COMMA VAR CLOSE SEMI {printf("PRINT %s\n",$7);}
   //| PRINT{printf("PRINT ");} OPEN QUOTE N DATA N QUOTE{printf("\"%s);",name); strcpy(name,"");}
   //| PRINT{printf("printf(\"");} QUOTE N QUOTE{printf("\");");} 
   ;

SC : SCAN OPEN QUOTE TYPE QUOTE COMMA ADDR VAR CLOSE SEMI{getspec($4);printf("READ %s %s\n",str,$8);}
   ;

CON :VAR RELOP VAR             { printf("%s %s %s",$1,$2,$3); }    
    | VAR RELOP NUM            { printf("%s %s %s",$1,$2,$3); }
    | VAR LOGOP VAR            { printf("%s %s %s",$1,$2,$3); }
    | BOOL { printf("%s",$1); }
    ;


 

%%


int yywrap()
{
  return 1;
}

void yyerror(const char* arg)
{

	printf("%s\n",arg);

}

//#include"lex.yy.c"
int main()
{
  extern FILE *yyin;
  yyin=fopen("input.txt","r");
  yyparse();
  return 0;

}







