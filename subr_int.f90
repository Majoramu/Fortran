SUBROUTINE Subr(f,a,b)
 
IMPLICIT NONE

REAL,INTENT(in)::a,b
REAL::f
INTEGER::n
REAL::sumatoria
INTEGER::i
REAL::integral
REAL:: h
  
  PRINT*,"Dame un valor de n"
  READ*,n

  h = (b-a)/real(n)

   
  sumatoria=0

  DO i=1,n-1,1
     sumatoria = sumatoria +f(a+real(i)*h)
  END DO

  integral = (h/2) * (f(a) + f(b) + 2*sumatoria)
  
  PRINT*,"El valor de tu integral es=", integral

End Subroutine Subr
