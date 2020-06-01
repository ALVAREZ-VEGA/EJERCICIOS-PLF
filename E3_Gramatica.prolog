%
%	Gramatica
%
%	<expr> ::= <op> <numero> <numero>
%	<op> ::= '-' | '+' | '/' | '*'
%	<numero> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%
%
%	ejemplo
%	+ 1 2
%
%	Defina en prolog un predicado que permita validar la gramatica
%	Anterior
%
%	expr("+",1,2).
%	true.
%
%	expr("+",11,2). % falso por que esta limitado a un solo numero
%	false.
%
%	expr("/",10,5).
%	true.
%
%	expr("+","*",2).
%	false.
%
%	Hay un predicado en prolog que te verifica si un atomo es un numero
%	number(2).
%	true.
%
%	number('+').
%	false
%
%ALUMNA: ALVAREZ VEGA SOCORRO
%
op("-").
op("+").
op("/").
op("*").
num(0).
num(1).
num(2).
num(3).
num(4).
num(5).
num(6).
num(7).
num(8).
num(9).
opcion(A) :- op(A).
numero(B) :- num(B).
exp(A,B,C) :- opcion(A), numero(B), numero(C).


