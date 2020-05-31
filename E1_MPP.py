# -*- coding: utf-8 -*-
"""
Created on Mon May 11 18:11:43 2020

@author: Kokiz
"""
"""
# Modus ponendo ponens

"el modo que, al afirmar, afirma"

P → Q. P ∴ Q


Se puede encadenar usando algunas variables

P → Q. 
Q → S. 
S → T. P ∴ T

Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponda

Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America


"""
Base = [
	["Laura","Queretaro"],
	["Alena","Paris"],
	["Claudia","San Francisco"],
	["Queretaro","Mexico"],
	["Paris","Francia"],
	["San Francisco","EUA"],
	["Mexico","America"],
	["Francia","Europa"],
	["EUA","America"]
]
def buscar(E3,E1):
	if not E3:
		return []
	if len(E3):
		if E1 == E3[0][0]:
			return E3[0][1]
		else:
			return buscar(E3[1:],E1)


def esta (E1,E2):
	A = buscar(Base,E1)
	R = buscar(Base, A)
	if R == E2 or A == E2:
		return True
	S = buscar(Base, R)
	if S == E2:
		return True
	else:
		return False

print(esta("Alena","Europa"))
# true

print(esta("Laura","America"))
# true

print(esta("Laura","Europa"))
# false

print(esta("Queretaro","Mexico"))
# True

print(esta("Francia","America"))
# False