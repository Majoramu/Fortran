PROGRAM ordenarnumeros

!Este programa ordenara n numeros de mayor a menor, o viceversa, segun en usuario decida

IMPLICIT NONE
INTEGER:: aux,m,i,j,k,x,ok
REAL:: n2,temp
REAL,allocatable:: N(:)
CHARACTER(10):: orden

Allocate(N(1:x), stat=ok)
If (ok==0) then
	Print*, "Cuantos numeros desea ordenar?"
	Read*, x
	Print*, "Teclee los numeros a ordenar"
	DO i=1, x
		Read*, n2	
		n(i)=n2
	END DO
	DO i=1, x -1
		aux=i
		DO j=i+1, x
			IF ((N(j))<(N(aux))) then
				aux=j
			END IF
		END DO
	IF (i/=aux) THEN
		temp=N(i)
		N(i)=N(aux)
		N(aux)=temp
	END IF
	END DO
ELSE
Print*,"Error, memoria insuficiente"
END IF
Print*, "Caul deseas que sea el orden?"
Read*, orden

IF(orden=='ascendente') THEN
	DO i=1, x
		Print*, N(i)
	END DO
ELSE
	DO i=x, 1,-1
		Print*, N(i)
	END DO
END IF
END PROGRAM ordenarnumeros	
