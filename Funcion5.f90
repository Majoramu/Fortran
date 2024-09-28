FUNCTION Funcion5(m)
  IMPLICIT NONE
  INTEGER::Funcion5
  REAL,INTENT(IN)::m
  Funcion5=1/(sqrt(1-m**2)*sqrt(1-0.6*m**2))
END FUNCTION
