%{
#include "if-else.tab.h"
%}


%%

"if"   	{return IF;}
"else if" {return ELIF;}
"else"  {return ELSE;}
"("   	{return LP;}
")"   	{return RP;}
"{"   	{return LCB;}
"}"     {return RCB;}
"true"  {return TRUE;}
"false" {return FALSE;}
";"     {return SEMI;}
[0-9]+ 	{yylval=atoi(yytext);return NUMBER;}
[\n \t]+ 	{/*空白忽略*/}
. 	{printf("非法字符 %c\n",*yytext);}

%%