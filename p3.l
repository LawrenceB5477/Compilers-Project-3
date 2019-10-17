%{
#include "p3.tab.h"
extern int yylval; 

%}

SYMBOL "("|")"|","|"["|"]"
COMPARE "<"|">"|"<="|">="|"="|"<>"
VAL [0-9]
WHITESPACE [ \t]*
NEWLINE \n

%%

"RENAME" return RENAME; 
"AS" return AS; 
"WHERE" return WHERE; 
{SYMBOL} return *yytext; 
"UNION" return UNION;
"INTERSECT" return INTERSECT;
"MINUS" return MINUS;
"TIMES" return TIMES;
"JOIN" return JOIN;
"DIVIDEBY" return DIVIDEBY;
{COMPARE} return COMPARE;
{VAL}+ return NUMBER; 
"CNO" return CNO;
"CITY" return CITY;
"CNAME" return CNAME;
"SNO" return SNO; 
"PNO" return PNO; 
"TQTY" return TQTY;
"SNAME" return SNAME;
"QUOTA" return QUOTA; 
"PNAME" return PNAME;
"COST" return COST;
"AVQTY" return AVQTY;
"S#" return SSHARP;
"STATUS" return STATUS; 
"P#" return PSHARP; 
"COLOR" return COLOR; 
"WEIGHT" return WEIGHT; 
"QTY" return QTY;
"S" return S;
"P" return P; 
"SP" return SP;
"PRDCT" return PRDCT;
"CUST" return CUST; 
"ORDERS" return ORDERS; 
{WHITESPACE} ;
{NEWLINE} ;
. {printf("REJECT\n"); exit(0); }; 

%%
