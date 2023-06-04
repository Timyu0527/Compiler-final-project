%{
#include"parser.tab.h"
#include<string.h>
%}

number [0-9]+
string [\"][^\"]+[\"]
blank [\n\t ]+

%%

"cout"      {return COUT;}
"endl"      {return ENDL;}
{number}    {yylval.number = atoi(yytext); return NUMBER;}
{string}    {char *tmp = strdup(yytext); tmp++; tmp[strlen(tmp) - 1] = '\0'; yylval.string = strdup(tmp); return STRING;}
"<<"        {return INSERT;}
";"         {return SEMI;}
{blank}     {;}

%%
