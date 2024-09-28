PROGRAM INTEGRALS 
IMPLICIT NONE
                             !En este programa se realizan cinco integrales distintas

REAL::a,b              !Valores iniciales y finales de las integrales
INTEGER::option            !Opción para escoger la integral

PRINT*,"Escriba 1,2,3,4 o 5 segun la funcion que desee calcular"
PRINT*,"1)e**-x**2"
PRINT*,"2)sen(x**2)"
PRINT*,"3)cos(x**2)"
PRINT*,"4)sqrt(1-x**2*sen(x)**2)"
PRINT*,"5)1/(sqrt(1-x**2)*sqrt(1-(0.6*x)**2))"

READ*,option                 !El usuario elige la integral

SELECT CASE(option)        
CASE(1)                      !Se elige e**-x**2
    PRINT*,"Ingrese el valor inicial y el valor final de su integral"
    READ*,a,b              !Se ingresan los valores inicial y final
Call subr(Funcion1,a,b)

CASE(2)                      !Se elige sen(x**2)
    PRINT*,"Ingrese el valor inicial y el valor final de su integral"
    READ*,a,b              !Se ingresan los valores inicial y final
Call subr(Funcion2,a,b)

CASE(3)                      !Se elige cos(x**2)
    PRINT*,"Ingrese el valor inicial y el valor final de su integral"
    READ*,a,b              !Se ingresan los valores inicial y final
Call subr(Funcion3,a,b)

CASE(4)                      !Se elige sqrt(1-x**2*sen(x)**2)
    PRINT*,"Ingrese el valor inicial y el valor final de su integral"
    READ*,a,b              !Se ingresan los valores inicial y final
Call subr(Funcion4,a,b)

CASE(5)                      !Se elige 1/(sqrt(1-x**2)*sqrt(1-(0.6*x)**2))
    PRINT*,"Ingrese el valor inicial y el valor final de su integral"
    READ*,a,b          !Se ingresan los valores inicial y final
Call subr(Funcion5,a,b)

CASE DEFAULT
PRINT*,"Eliga la opción correcta"
END SELECT
END PROGRAM

