PROGRAM Proyectil

!Este programa describira el movimiento de un proyectil y
!realizara una simulacion de este, el usuario proporcionara
!la velocidad inicial, el angulo de sentido y la posicion
!inicial.

IMPLICIT NONE

Real:: velocidad, angulo,ancho,tv,grados
REAL::vox 			!velocidad inicial eje x
REAL::voy 			!velocidad inicial eje y
REAL::temp_v 			!tiempo total de vuelo
Real, Parameter:: g=9.81, pi=3.1415926
Real, allocatable:: X(:), Y(:), T(:)
Integer:: i,j,ok,nerr,n

Print*, "Indique la velocidad inicial del proyectil"
Read*, velocidad
Print*, "indique el angulo con el que fue proyectado"
Read*, angulo
PRINT*,"Indique el numero de particiones del tiempo"
READ*,n

grados=angulo/(180./pi)


IF (velocidad>0 .AND. angulo>0) THEN
	vox= velocidad*cos(grados)
	voy=velocidad*sin(grados)
	!tiempo total de vuelo
	temp_v=2.*(voy/g)
	Print*, "Tiempo total de vuelo=",temp_v


PRINT*,vox,voy,grados

	ancho= temp_v/n
	Allocate (T(0:n),X(0:n),Y(0:n), stat=ok)
	IF (ok==0) THEN	
		DO i=0, n
			T(i)= Ancho*i     !Tiempo en funcion del indice
		END DO
		DO i=0, n
			X(i)= vox*T(i)		!posicion en el eje x con el tiempo
		END DO
		DO i=0, n
			Y(i)= (voy*T(i))-(g*(T(i)**2)/2)  !posicion en el eje y con el tiempo
		END DO
	ELSE
		Print*, "Error, memoria insuficiente"
	END IF

 

	OPEN (UNIT=4, FILE="proyectiles", STATUS="unknown")  !se crea el archivo con las posiciones
	DO i=0, n
		write(4,*)x(i),Y(i)
	END DO
	CLOSE (4)


CALL freefall(n,x,y,t)

ELSE 
	Print*, "La velocidad y el angulo deben de ser positivos"
END IF
Deallocate (T)
Deallocate (X)
Deallocate (Y)
END PROGRAM Proyectil

