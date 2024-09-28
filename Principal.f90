PROGRAM Principal
  IMPLICIT NONE
  REAL::r,t
  INTEGER,EXTERNAL::Funcion1,Funcion2,Funcion3,Funcion4,Funcion5
  REAL::pi=3.1416
  CHARACTER::OPCION,a,b,c,d,e
  PRINT*,"Escoge la letra de la funcion que quieres hacer"
  PRINT*,"a)e**-x**2"
  PRINT*,"b)sen(x**2)"
  PRINT*,"c)cos(x**2)"
  PRINT*,"d)sqrt(1-x**2*sen(x)**2)"
  PRINT*,"e)1/(sqrt(1-x**2)*sqrt(1-(0.6*x)**2))"
  READ*,OPCION
  SELECT CASE(OPCION)
  CASE("a","A")
     PRINT*,"Ahora dame un valor inicial y uno final"
     READ*,r,t
     call Subr(Funcion1,r,t)
  CASE("b","B")
     PRINT*,"Ahora dame un valor inicial y uno final"
     READ*,r,t
     call Subr(Funcion2,r,t)
  CASE("c","C")
     PRINT*,"Ahora dame un valor inicial y uno final"
     READ*,r,t
     call Subr(Funcion3,r,t)
  CASE("d","D")
     PRINT*,"Ahora dame un valor inicial y uno final"
     READ*,r,t
     call Subr(Funcion4,r,t)
  CASE("e","E")
     PRINT*,"Ahora dame un valor inicial y uno final"
     READ*,r,t
     call Subr(Funcion5,r,t)
  CASE DEFAULT
     PRINT*,"Para tus tonterias preguntale mejor a tus amiguitas :D"
  END SELECT
  END PROGRAM
