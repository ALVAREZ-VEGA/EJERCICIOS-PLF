"""
Created on Mon May 11 18:11:43 2020

@author: Kokiz
"""
"""
"""
	https://www.computrabajo.com.mx/ofertas-de-trabajo/oferta-de-trabajo-de-desarrollador-batch-exp-sistemas-abiertos-en-queretaro-601BC72F6CEBB0F761373E686DCF3405
	En una empresa solicitan Lic./Ing. en Sistemas, Computación o afín.
	con los siguientes requisitos:
	• Oracle BBDD

	• SQL y PL/SQL

	• Linux

	• Unix

	• Shell (Linux - Unix)

	• C++, Proc*C y Tuxedo V12 o anteriores

	• Visual Basic 6.0

	• Java (Frameworks) , Web Services y Micro Servicios APIs
	
	Realizar un programa que realice preguntas al usuario
	y que apartir de sus respuestas evalue si es cadidato o no
	
	(usen conjuntos)

"""
#ALUMNA: ALVAREZ VEGA SOCORRO
#Coloque 8 requisitos como minimo para ser candidato 
#ya que representa el 70% de los requisitos


Requisitos = {
	"Oracle","SQL/PL","Linux","Unix","Shell","C++",
	"Proc*C","TuxedoV12", "VB6", "Java","WebServices","MicroServicios"
} 


def evaluar(Conocimientos,Nombre):
    T = len(Requisitos)
    S = len(Conocimientos)
    Experiencia = Requisitos & Conocimientos
    print ("\n",Nombre,"cumples con ",S," requisitos ")
    print ("los cuales son: ",Experiencia)
    falta = Requisitos - Conocimientos
    print ("Requisitos faltantes: ",falta)
    R = T-S
    if R <= 4:
        print ("Es candidato(a)")
    else: 
         print ("No es candidato(a)")


def experiencia_usuario():
    Conocimientos = set()
    Nombre = input("\n ¿Cuál es su nombre?")
    print("\nResponder (si o no) a las siguentes preguntas")
    R1 = input("\n ¿Conocimiento en Oracle?")
    if (R1 == 'si'):
        Conocimientos.add("Oracle")
    R2 = input("\n ¿Conocimiento en SQL/PL?")
    if (R2 == 'si'):
        Conocimientos.add("SQL/PL")
    R3 = input("\n ¿Conocimiento en Linux?")
    if (R3 == 'si'):
        Conocimientos.add("Linux")
    R4 = input("\n ¿Conocimiento en Unix?")
    if (R4 == 'si'):
        Conocimientos.add("Unix")
    R5 = input("\n ¿Conocimiento en Shell?")
    if (R5 == 'si'):
        Conocimientos.add("Shell")
    R6 = input("\n ¿Conocimiento en C++?")
    if (R6 == 'si'):
        Conocimientos.add("C++")
    R7 = input("\n ¿Conocimiento en Proc*C?")
    if (R7 == 'si'):
        Conocimientos.add("Proc*C")
    R8 = input("\n ¿Conocimiento en TuxedoV12?")
    if (R8 == 'si'):
        Conocimientos.add("TuxedoV12")
    R9 = input("\n ¿Conocimiento en VB6?")
    if (R9 == 'si'):
        Conocimientos.add("VB6")
    R10 = input("\n ¿Conocimiento en Java?")
    if (R10 == 'si'):
        Conocimientos.add("Java")
    R11 = input("\n ¿Conocimiento en WebServices?")
    if (R11 == 'si'):
        Conocimientos.add("WebServices")
    R12 = input("\n ¿Conocimiento en MicroServicios?")
    if (R12 == 'si'):
        Conocimientos.add("MicroServicios")
    return evaluar(Conocimientos,Nombre)
    

print(experiencia_usuario())

