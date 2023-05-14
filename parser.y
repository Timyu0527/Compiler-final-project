%{
#include<stdio.h>
#include<stdlib.h>
%}

%type <number> display

%union {
    int number;
    char *string;
}

%token <string> STRING
%token <number> NUMBER 
%token COUT ENDL SEMI
%token INSERT


%%

displayStatement: 
    display SEMI
    | displayStatement display SEMI
;

display:
    COUT                    {$$ = (int)stdout;}
    | display INSERT STRING {printf("%s", $3); $$ = $1; free(yylval.string);}
    | display INSERT NUMBER {printf("%d", $3); $$ = $1;}
    | display INSERT ENDL   {printf("\n"); $$ = $1;}
;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}
