parser grammar TestParser;

options
   { tokenVocab = TestLexer; }
/*
 * expr, inner_expr, arithmetic_expr形成 left-recursive
 * 
 * expr的本意是代表任意表达式（带括号、或者不带括号的），包括整型数值、浮点数值、函数调用、算术表达式
 * inner_expr的本意是代表任意不带括号的表达式
 * arithmetic_expr本意是代表算术表达式（这个例子中限于双元操作），其每一元操作数又是一个expr
 * 
 * 这样一来，expr可能是一个inner_expr，inner_expr又可能是一个arithmetic_expr，arithmetic_expr的开头又是一个expr，如此形成了left-recursive。
 * parser无法判定使用哪一条规则进行解析。或者，更准确地说：三条规则所覆盖的token pattern范围存在重叠的现象。
 * 例如，1+2这个字符串的解析结果可以是expr、inner_expr、arithmetic_expr三者中的任意一种。
 */
 
expr
	: LPAREN inner_expr RPAREN | inner_expr
	;

inner_expr
	:  DOUBLE | INT | func_call | arithmetic_expr
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


