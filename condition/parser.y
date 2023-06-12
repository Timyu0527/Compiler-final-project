%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER BOOL
%token EOL
%token LPAREN RPAREN

%token NOT B_NOT
%token MUL DIV MOD
%token ADD SUB
%token LSHIFT RSHIFT
%token LT LE GT GE
%token EQ NE
%token B_AND
%token B_XOR
%token B_OR
%token AND
%token OR
%token QUES
%token COLON


%%
condition:
    |condition exp16 EOL {printf("=%d\n",$2);}
    ;

exp16:exp15 {$$=$1;}
    |exp15 QUES exp15 COLON exp15 {$$=$1?$3:$5;}
    ;

exp15:exp14 {$$=$1;}
    |exp15 OR exp14 {$$=$1||$3;}
    ;

exp14:exp13 {$$=$1;}
    |exp14 AND exp13 {$$=$1&&$3;}
    ;

exp13:exp12 {$$=$1;}
    |exp13 B_OR exp12 {$$=$1|$3;}
    ;

exp12:exp11 {$$=$1;}
    |exp12 B_XOR exp11 {$$=$1^$3;}
    ;

exp11:exp10 {$$=$1;}
    |exp11 B_AND exp10 {$$=$1&$3;}
    ;

exp10:exp9 {$$=$1;}
    |exp7 EQ exp7 {$$=$1==$3;}
    |exp7 NE exp7 {$$=$1!=$3;}
    ;

exp9:exp7 {$$=$1;}
    |exp7 LT exp7 {$$=$1<$3;}
    |exp7 LE exp7 {$$=$1<=$3;}
    |exp7 GT exp7 {$$=$1>$3;}
    |exp7 GE exp7 {$$=$1>=$3;}
    ;

exp7:exp6 {$$=$1;}
    |exp7 LSHIFT exp6 {$$=$1<<$3;}
    |exp7 RSHIFT exp6 {$$=$1>>$3;}
    ;

exp6:exp5 {$$=$1;}
    |exp6 ADD exp5 {$$=$1+$3;}
    |exp6 SUB exp5 {$$=$1-$3;}
    ;

exp5:exp3 {$$=$1;}
    |exp5 MUL exp3 {$$=$1*$3;}
    |exp5 DIV exp3 {$$=$1/$3;}
    |exp5 MOD exp3 {$$=$1%$3;}
    ;

exp3:term {$$=$1;}
    |NOT term {$$=!$2;}
    |B_NOT term {$$=~$2;}
    ;

term:
    NUMBER {$$=$1;}
    |BOOL {$$=$1;}
    |LPAREN exp16 RPAREN {$$=$2;}
    ;

%%
int main(){
	yyparse();
    return 0;
}

int yyerror(char *s)
{
 fprintf(stderr,"error:%s\n",s);
}