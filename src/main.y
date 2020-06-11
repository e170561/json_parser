%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}''['']'',' ':'EOL INT STR FLT   

%%
S: JS EOL { printf("VALIDO\n");return 0;}
   ; 
JS:
   '{'C'}' {}
 ;
C: 
   T':'E {} 
   |C','C {}
   ;

T: 
  STR {}

 ;
E:
    INT {}
    | FLT {}
    | STR {}
    | L {}
    | JS {}
    | C {}
    | E','E {}

 ;
L: 
  '['E']' {}
  | '['']' {}
 ;



%%

void yyerror(char *s) {
printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
