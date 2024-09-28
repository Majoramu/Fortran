PROGRAM matrices

!Este programa leera dos matrices de tamaño nxm y mxb y las multiplicara

IMPLICIT NONE
Real,Allocatable:: A(:,:), B(:,:), C(:,:)
Integer:: ok,j,i,k,n,m,p,g,l


Print*, "Este programa multiplicara 2 matrices dadas"
Print*, "Escribe las dimensiones de la matriz A (nxm)"
Read*, n						!num de renglones de A
Read*, m						!num de columnas de A
Print*, "Escribe las dimensiones de la matriz B (mxb)"
Read*,g							!num de renglones de B
Read*,p							!num de columnas de B

IF (n/=p) THEN						!si m es distinto de g
	Print*, "Error"					
	Print*, "El numero de columnas de A tiene que ser igual al numero de renglones de B"
ELSE							!Si m es igual a g
	Allocate (A(1:n,1:m),B(1:g,1:p),C(1:n,1:p), stat=ok) 	
	IF (ok==0) THEN
		Print*, "Ingrese los datos de la matriz A (por renglones)"		
		DO i=1, n		
			DO j=1, m
				Read*, A(i,j)
			END DO
		END DO
		Print*, "Ingrese los datos de la matriz B (por renglones)"
		DO i=1, g		
			DO j=1, p
				Read*, B(i,j)
			END DO
		END DO

		Print*, "Matriz A"	
		DO i=1, n
			Print*,A(i,j)
		END DO
		
		Print*, "Matriz B"
		DO i=1, g
			Print*, B(i,j)
		END DO
		DO i=1, n
			DO j=1, p
				C(i,j)=0.0
				DO k=1, l
					C(i,j)= ((A(i,k))*(B(k,j))) + C(i,j)
				END DO
			END DO		
		END DO

		Print*, "Matriz C"
		DO i=1,n
			Print*, C(i,j)
		END DO

	ELSE 
		Print*, "Error, memoria insuficiente"
	END IF
END IF
Deallocate (A)
Deallocate (B)
Deallocate (C)

END PROGRAM matrices
	


 
