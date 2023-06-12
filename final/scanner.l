%{
#include"ifelse.tab.h"
#include<string.h>
%}

number [0-9]+
string [\"][^\"]+[\"]

%%

"cout"      {return COUT;}
"endl"      {return ENDL;}
{number}    {yylval.number = atoi(yytext); return NUMBER;}
{string}    {char *tmp = strdup(yytext); tmp++; tmp[strlen(tmp) - 1] = '\0'; yylval.string = strdup(tmp); return STRING;}

";"         {return SEMI;}

[\t \n] 	{;}

"true"      {yylval.number=1; return BOOL;}
"false"     {yylval.number=0; return BOOL;}
"("         {return LPAREN;}
")"         {return RPAREN;}

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

"if"   	{return IF;}
"else if" {return ELIF;}
"else"  {return ELSE;}

"{"   	{return LCB;}
"}"     {return RCB;}

. 	{printf("unknown character %c\n",*yytext);}

%%