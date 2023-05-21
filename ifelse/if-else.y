%{
#include <stdio.h>
%}

%token IF ELIF ELSE LP RP LCB RCB TRUE FALSE NUMBER
%token EOL


%%

S:
|ifElse S;

ifElse: if {printf("%d\n",$1);}
;

if:IF LP condition RP LCB statement RCB {if($3){$$ = $6;}else{$$=0;}}
|IF LP condition RP LCB statement RCB elif {if($3){$$ = $6;}else{$$=$8;} }
;

elif:ELIF LP condition RP LCB statement RCB elif {if($3){$$ = $6;}else{$$=$8;}}
|ELIF LP condition RP LCB statement RCB else {if($3){$$ = $6;}else{$$=$8;}}
|ELIF LP condition RP LCB statement RCB {if($3){$$ = $6;}}
;

else:ELSE LCB statement RCB {$$ = $3;}
;

condition:TRUE  { $$ = 1; }
|FALSE { $$ = 0; }
;

statement:number { $$ = $1; }
|ifElse statement { $$ = $2; }


;


number:NUMBER {$$=$1;}
%%

main(int argc,char **argv){
	yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"error:%s\n",s);
}