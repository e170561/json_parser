%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' '"'EOL INT STR FLT   

%%
S: JS EOL { printf("VALIDO\n");}
   ; 
JS:
   '{'T':' T'}' {}
 ;
T:
    '"'STR'"' {}
 ;



%%

void yyerror(char *s) {
printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
