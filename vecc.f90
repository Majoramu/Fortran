PROGRAM vectores

IMPLICIT NONE

!Este programa calcula los vectores de posicion y velocidad

REAL::t					!Tiempo 
REAL,DIMENSION(3):: X0, X, V		!Vectores de posicion (x,y) y de velocidad
INTEGER::i,n				
INTEGER::num_error	
CHARACTER(len=50)::mens_error

X0 = RESHAPE ([0,0,0],[1,3])

PRINT*,'Ingrese la velocidad en km/h'
READ*,V
PRINT*,'Ingrese el tiempo de recorrido'
READ*,t

	Allocate (X(0:n), stat=ok, ERRMSG=mens_error)
	IF (ok==0) THEN	

		DO i=0, n
			X(i)= V*t
		PRINT*,X(i)

END IF
!OPEN(UNIT=30,FILE="A1.dat",STATUS="UNKNOWN",IOSTAT=num_error,IOMSG=mens_error)
! 
!	IF(num_error==0)THEN	
!		
!	WRITE(30,*)X(i)
! 
!		ELSE
! 
!		PRINT*,mens_error
!		END DO
!	END IF
!CLOSE(30)
END DO
DEALLOCATE(X)
DEALLOCATE(V)

END PROGRAM 
