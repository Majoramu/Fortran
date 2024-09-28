FUNCTION Funcion4(l)
  IMPLICIT NONE
  INTEGER::Funcion4
  REAL,INTENT(IN)::l
  Funcion4=sqrt(1-l**2*sin(l)**2)
  END FUNCTION
