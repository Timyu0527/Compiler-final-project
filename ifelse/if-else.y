%{
#include <stdio.h>
%}

%token IF ELIF ELSE LP RP LCB RCB TRUE FALSE NUMBER
%token EOL


%%

ifElse: 
| if ifElse
;

if: IF LP condition RP LCB statement RCB {if($3){printf("test %d\n",$6);}}
|IF LP condition RP LCB statement RCB elif {if($3){printf("test %d\n",$6);}else{$8;} }
;

elif: ELIF LP condition RP LCB statement RCB elif {if($3){printf("test %d\n",$6);}else{$8;}}
|ELIF LP condition RP LCB statement RCB else {if($3){printf("test %d\n",$6);}else{$8;}}
|ELIF LP condition RP LCB statement RCB {if($3){printf("test %d\n",$6);}}
;

else: ELSE LCB statement RCB {printf("test %d\n",$3);}
;

condition: TRUE  { $$ = 1; }
| FALSE { $$ = 0; }
;

statement:number statement2
|statement2
;

statement2:
|if statement2

number:NUMBER 
%%

main(int argc,char **argv){
	yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"error:%s\n",s);
}