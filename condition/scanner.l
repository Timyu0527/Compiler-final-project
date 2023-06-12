%{
#include "praser.tab.h"
%}

%%

[0-9]+      {yylval = atoi(yytext); return NUMBER;}
"true"      {yylval=1; return BOOL;}
"false"     {yylval=0; return BOOL;}
"("         {return LPAREN;}
")"         {return RPAREN;}


[\t] 	{;}
[ ] 	{;}
[\n]     {return EOL;}


"!"         {return NOT;}
"~"         {return B_NOT;}

"*"         {return MUL;}
"/"         {return DIV;}
"%"         {return MOD;}

"+"         {return ADD;}
"-"         {return SUB;}

"<<"        {return LSHIFT;}
">>"        {return RSHIFT;}

"<="        {return LE;}
">="        {return GE;}
"<"         {return LT;}
">"         {return GT;}

"=="        {return EQ;}
"!="        {return NE;}

"&"         {return B_AND;}

"^"         {return B_XOR;}

"|"         {return B_OR;}

"&&"        {return AND;}

"||"        {return OR;}

"?"         {return QUES;}
":"         {return COLON;}

. 	{printf("unknown character %c\n",*yytext);}
%%