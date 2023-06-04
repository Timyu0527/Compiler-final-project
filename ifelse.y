%{
#include<stdio.h>
#include<stdlib.h>
%}

%type <number> statement
%type <number> display
%type <number> ifElse
%type <number> if
%type <number> else
%type <number> elif
%type <number> condition
%type <number> exp16
%type <number> exp15
%type <number> exp14
%type <number> exp13
%type <number> exp12
%type <number> exp11
%type <number> exp10
%type <number> exp9
%type <number> exp7
%type <number> exp6
%type <number> exp5
%type <number> exp3
%type <number> term
%type <number> BOOL

%union {
    int number;
    char *string;
}

%token <string> STRING
%token <number> NUMBER 
%token COUT ENDL SEMI

%token EOL
%token LPAREN RPAREN

%token BOOL
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

%token IF ELIF ELSE LCB RCB


%%

S:
|ifElse S;

ifElse: if {printf("%d\n",$1);}
;

if:IF LPAREN condition RPAREN LCB statement RCB {printf("%d\n", $3); if($3){$$ = $6;}else{$$=0;}}
|IF LPAREN condition RPAREN LCB statement RCB elif {if($3){$$ = $6;}else{$$=$8;} }
;

elif:ELIF LPAREN condition RPAREN LCB statement RCB elif {if($3){$$ = $6;}else{$$=$8;}}
|ELIF LPAREN condition RPAREN LCB statement RCB else {if($3){$$ = $6;}else{$$=$8;}}
|ELIF LPAREN condition RPAREN LCB statement RCB {if($3){$$ = $6;}}
;

else:ELSE LCB statement RCB {$$ = $3;}
;


condition:{$$ = 0;}
    |condition exp16 EOL { $$ = $2; }
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

// statement:
// |number statement
// |ifElse statement
// ;

statement:
    display SEMI
    | display SEMI statement SEMI
    | ifElse statement
;

display:
    COUT                    {$$ = (int)stdout;}
    | display LSHIFT STRING {printf("%s", $3); $$ = $1; free(yylval.string);}
    | display LSHIFT NUMBER {printf("%d", $3); $$ = $1;}
    | display LSHIFT ENDL   {printf("\n"); $$ = $1;}
;

// number:NUMBER SEMI{$$=$1;}

%%

int yyerror(char *s) {
    fprintf(stderr,"error:%s\n",s);
}

int main() {
    yyparse();
    return 0;
}
