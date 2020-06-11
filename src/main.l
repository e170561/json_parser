
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

/*  %token '{' '}''['']' ':' '"'',' INT STR FLT   */

STR [A-Za-z0-9\ ]+
INT [0-9]+
SP [\n\t\ ]

%%
\n {return EOL; }
(\{){SP}* {return '{'; }
{SP}*(\}) {return '}'; }
(\[){SP}* {return '['; }
{SP}*(\]) {return ']'; }
(\,){SP}+ {return ','; } 
[\:]{SP}+ {return ':'; }
{INT}(\.){INT} {return FLT;}
{INT} {return INT; }
(\"){STR}(\") {return STR; }
. ;




%%

int yywrap() {
  return 1;
}
