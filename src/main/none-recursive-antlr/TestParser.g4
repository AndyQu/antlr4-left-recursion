parser grammar TestParser;

options
   { tokenVocab = TestLexer; }
 
/*
 * 与src/main/antlr下的TestParser.g4相比，这里把arith_expr进行了详细的拆解定义，不再依赖于更高层次的expr，因此去除了left recursive
 */
expr
	: LPAREN inner_expr RPAREN | inner_expr
	;

inner_expr
	:  non_arith_expr | arith_expr
	;



non_arith_expr
	: DOUBLE | INT | func_call
	;

arith_expr
	: basic_arith_expr
	| basic_arith_expr_p 	arith_binary_op basic_arith_expr
	| basic_arith_expr		arith_binary_op basic_arith_expr_p
	| basic_arith_expr_p	arith_binary_op basic_arith_expr_p
	;

basic_arith_expr_p
	: LPAREN basic_arith_expr RPAREN
	;
	
basic_arith_expr
	: non_arith_expr (arith_binary_op non_arith_expr)+
	;
   
arithmetic_expr
	: expr arith_binary_op expr
	;

arith_binary_op
	: MINUS
	;
	
	

func_call
   : func_name LPAREN func_para_list RPAREN
   ;

func_name
   : ID
   ;

func_para
   : expr
   ;

func_para_list
   : expr ? (COMMA expr)* 
   ;


