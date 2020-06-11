
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

/*  %token '{' '}' ':' '"'',' INT STR FLT   */

Alfa [A-Za-z]+
STR [A-Za-z0-9\ ]+
INT [0-9]+


%%
\{ {printf("Encontrei um { \n");return '{'; }
\} {printf("ENcontrei um } \n");return '}'; }
[\:] {printf("Encontrei :  \n");return ':'; }
\" {printf("Encontrei aspas\n");return '"'; }
\, {return ','; }
\n {return EOL; }
\  {printf("Encontrei espaco\n");} 
[0-9]+[.][0-9]+ {printf("Encontrei um float\n"); return FLT;}
[0-9]+ {printf("Encontrei um INT\n"); return INT; }
(\"){STR}(\") {printf("Encontrei STR\n");return STR; }





%%

int yywrap() {
  return 1;
}
