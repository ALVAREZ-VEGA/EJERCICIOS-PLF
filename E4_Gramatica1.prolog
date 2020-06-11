% ALVAREZ VEGA SOCORRO
%
% Desarrolle un predicado que permita validar un NIP de una banco que
% Responde a la siguiente gramatica
% Nip ::= <Digito> ' ' <Digito> ' ' <Digito> ' ' <Digito>
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%
%nip("1235").
%true.
%
%nip("123").
%false.



latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).

preparar_string(Term,LS) :-
        atom(Term),
        atom_string(Term,Str),
        preparar_string(Str,LS).

preparar_string(Str,LS) :-
        string(Str),
        string_chars(Str,LAC),
        latom_lstring(LAC,LS).

digito(N) :-
       N == "0"; N == "1"; N == "2"; N == "3"; N == "4";
       N == "5"; N == "6"; N == "7"; N == "8"; N == "9".


digitos([F|[]]) :- digito(F).
digitos([F|C]) :- digito(F), digitos(C).

nip(NIP) :- string_length(NIP,4), preparar_string(NIP,RE), digitos(RE).




% Desarrolle un predicado que permita validar un octeto de una ip
% Responde a la siguiente gramatica
% Octeto ::= '2'<R5><R5> | '1'<Digito><Digito> | <Digito><Digito> | <Digito>
% R5 ::= 0 | 1 | 2 | 3 | 4 | 5
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%
%nip("255").
%true.
%
%nip("256").
%false

r5(R) :-
    R == "0"; R == "1"; R == "2"; R == "3"; R == "4"; R == "5".


opcion1([F|C]) :- F == "2", val([F|C]); F == "1", opcion2([F|C]).

val([F|[]]) :-  r5(F).
val([F|C]) :- r5(F), val(C).

opcion2([F|[]]) :- digito(F).
opcion2([F|C]) :- digito(F), opcion2(C).


octeto(OCT) :- string_length(OCT,3), preparar_string(OCT,RA),opcion1(RA);
               string_length(OCT,2), preparar_string(OCT,RA),opcion2(RA);
               string_length(OCT,1), preparar_string(OCT,RA),opcion2(RA).

