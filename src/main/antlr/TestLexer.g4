lexer grammar TestLexer;


DOT
   : '.'
   ;

INT
   : '0' .. '9'+
   ;

DOUBLE
   : '0' .. '9'+ DOT '0' .. '9'+
   ;

RPAREN
   : ')'
   ;


LPAREN
   : '('
   ;

MINUS
	:''
	;

COMMA
   : ','
   ;
  
ID
   : ( 'a' .. 'z' | 'A' .. 'Z' | '_' )+
   ;
