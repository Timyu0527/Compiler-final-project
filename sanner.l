{%
#include<stdlib.h>
%}

number [0-9]+
conditionSign [><]
blank [\n|\t| ]+
%%
{number}    {
                yylval = atoi(yytext);
                return (NUMBER);}
"if"        {return(IF);}
"else"      {return(ELSE);}
"{"         {return(BPR);}
"}"         {return(BPL);}
";"         {return(SEMI);}
"("         {return(PL);}
")"         {return(PR);}
{blank}     {;}