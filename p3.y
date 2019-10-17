%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex(); 
extern char *yytext;
extern FILE *yyin; 

%}
%start start
%token RENAME AS WHERE UNION INTERSECT MINUS TIMES JOIN DIVIDEBY
%token COMPARE NUMBER
%token CNO CITY CNAME SNO PNO TQTY SNAME QUOTA PNAME COST AVQTY
%token SSHARP STATUS PSHARP COLOR WEIGHT QTY
%token S P SP PRDCT CUST ORDERS
%%

start : expression {}

expression : onerelationexpression {}
            | tworelationexpression {}

onerelationexpression : renaming {}
                        | restriction {}
                        | projection {}

renaming : term RENAME attribute AS attribute {}

term : relation {}
    | '(' expression ')' {}

restriction : term WHERE comparison {}

projection : term {}
            | term '[' attributecommalist ']' {}

attributecommalist : attribute {}
                    | attribute ',' attributecommalist {}

tworelationexpression : projection binaryoperation expression {}

binaryoperation : UNION {} 
                | INTERSECT {}
                | MINUS {}
                | TIMES {}
                | JOIN {}
                | DIVIDEBY {} 

comparison : attribute compare number {} 

compare : COMPARE {}

number : NUMBER {} 

attribute : CNO {}
            | CITY {}  
            | CNAME {}
            | SNO {}
            | PNO {}
            | TQTY {}
            | SNAME {}
            | QUOTA {}
            | PNAME {}
            | COST {}
            | AVQTY {}
            | SSHARP {}
            | STATUS {}
            | PSHARP {}
            | COLOR {}
            | WEIGHT {}
            | QTY {}

relation : S {} 
        | P {}
        | SP {}
        | PRDCT {}
        | CUST {}
        | ORDERS {} 
%%

int main(int argc, char **argv) {
    yyin = fopen(argv[1], "r"); 
    if (!yyin) {
        printf("File Error!\n");
        exit(1); 
    }
    yyparse();
    printf("ACCEPT\n");
}

int yyerror() {
    printf("REJECT\n"); 
    exit(0); 
}

int yywrap() {
    //exit(0); 
}