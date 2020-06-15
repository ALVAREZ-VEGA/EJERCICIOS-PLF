% Desarrollo una gramatica bnf (como la del video) para validar una
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo
% ALVAREZ VEGA SOCORRO

%ip("192.168.1.1").
%true.
%ip("256.168.1.1").
%false.
%maskR("255.255.255.0").
%true.
%maskR("255.255.255.1").
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


r5(R):- R == "0"; R == "1"; R == "2"; R == "4"; R == "5"; R == "8".

digito(N) :-
   N == "0"; N == "1"; N == "2"; N == "3"; N == "4";
   N == "5"; N == "6"; N == "7"; N == "8"; N == "9".

%-------------------------- DIRECCION IP -------------------------

ip(IP) :- split_string(IP,".",",",LIST), mandar_ip(LIST).

mandar_ip([F|[]]) :- validar_ip(F).
mandar_ip([F|C])  :- validar_ip(F), mandar_ip(C).

validar_ip(DIR) :- string_length(DIR,3),preparar_string(DIR,SEP), opcion_1(SEP);
                   string_length(DIR,2),preparar_string(DIR,SEP), opcion_2(SEP);
                   string_length(DIR,1),preparar_string(DIR,SEP), opcion_2(SEP).

opcion_1([F|C]) :- F == "2", octeto([F|C]); F == "1", opcion_2([F|C]).
opcion_2([F|[]]) :- digito(F).
opcion_2([F|C])  :- digito(F), opcion_2(C).

octeto([F|[]]) :- r5(F).
octeto([F|C])  :- r5(F), octeto(C).

% ----------------------- MASCARA DE RED-----------------------------

masRED(MASCARA) :- split_string(MASCARA,".",",",MR), mandar_mascara(MR).

mandar_mascara([F|[]])  :- val_masred(F).
mandar_mascara([F|C])  :- val_masred(F), mandar_mascara(C).

val_masred(MASC) :- string_length(MASC,3),preparar_string(MASC,RS), opcion1_mc(RS);
                    string_length(MASC,2),preparar_string(MASC,RS), opcion2_mc(RS);
                    string_length(MASC,1),opcion3_mc(MASC).

opcion1_mc([F|C]):- F == "2", octeto([F|C]);
                    F == "1", opcion2_mc([F|C]).
opcion2_mc([F|[]]):- digito(F).
opcion2_mc([F|C]):- digito(F), opcion2_mc(C).
opcion3_mc(MC):- MC == "0".
