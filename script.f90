!
!! freefall.f08
!! 
!! Made by (Dupret Alberto Santana Bejarano)
!! Login   <dupret@Rhapsody>
!! 
!! Started on  Tue Feb 24 09:12:02 2015 Dupret Alberto Santana Bejarano
!! Last update Time-stamp: <2016-nov-03.jueves 12:09:11 (dupret)>
!

SUBROUTINE freefall(n,x,y,t)
  
  IMPLICIT NONE
  
  INTEGER:: i,unit0,j,n,unit1
  CHARACTER(len=8)::name1
  CHARACTER(len=8)::name2
  CHARACTER(len=8)::name3
  CHARACTER(len=3)::indice
  REAL, DIMENSION(1:n)::x,y,t
  
  DO i=1,n
     IF(i<=9)THEN
        WRITE(indice,'(i1)') i
        name1='proy.00'//indice
        OPEN(NEWUNIT=unit0, FILE=name1, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) x(j),y(j),x(i),y(i)
        ENDDO
        CLOSE(unit0)
        OPEN(UNIT=8456731, FILE="script.gnu", STATUS="UNKNOWN",ACCESS&
             &="APPEND")
        WRITE(8456731,*) 'set xrange[',MINVAL(x)-2,':',MAXVAL(x)+2,']'
        WRITE(8456731,*) 'set yrange[',MINVAL(y)-1,':',MAXVAL(y)+2,']'
        WRITE(8456731,*) 'set grid'
        WRITE(8456731,*) 'set xzeroaxis linetype 3 linewidth 2.5'
        WRITE(8456731,*) 'set yzeroaxis linetype 3 linewidth 2.5'
        WRITE(8456731,*) 'set label 1 "Eje X" at graph 0.5,0.1 center'
        WRITE(8456731,*) 'set label 2 "Eje y" at graph 0.05,0.5 center'
        WRITE(8456731,*) 'plot ', '"'//name1//'"',' using 1:2 with dots title "t=',t(i),'s",'&
             &,'"'//name1//'"', ' using 3:4 with points pt 7 ps 3 notitle'
        WRITE(8456731,*) "set term png"
        WRITE(8456731,*) "set output ", '"'//name1//'.png'//'"'
        WRITE(8456731,*) "replot"
     ELSE IF(i>9 .AND. i<=99)THEN
        WRITE(indice,'(i2)') i
        name2='proy.0'//indice
        OPEN(NEWUNIT=unit0, FILE=name2, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) x(j),y(j),x(i),y(i)
        ENDDO
        CLOSE(unit0)
        OPEN(UNIT=8456731, FILE="script.gnu", STATUS="UNKNOWN",ACCESS="APPEND")
        WRITE(8456731,*) 'plot ', '"'//name2//'"',' using 1:2 with dots title "t=',t(i),'s",'&
             &,'"'//name2//'"', ' using 3:4 with points pt 7 ps 3 notitle'
        WRITE(8456731,*) "set term png"
        WRITE(8456731,*) "set output ", '"'//name2//'.png'//'"'
        WRITE(8456731,*) "replot"
     ELSE IF(i>=100)THEN
        WRITE(indice,'(i3)') i
        name3='proy.'//indice
        OPEN(NEWUNIT=unit0, FILE=name3, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) x(j),y(j),x(i),y(i)
        ENDDO
        CLOSE(unit0)
        OPEN(UNIT=8456731, FILE="script.gnu", STATUS="UNKNOWN",ACCESS="APPEND")
        WRITE(8456731,*) 'plot ', '"'//name3//'"',' using 1:2 with dots title "t=',t(i),'s",'&
             &,'"'//name3//'"', ' using 3:4 with points pt 7 ps 3 notitle'
        WRITE(8456731,*) "set term png"
        WRITE(8456731,*) "set output ", '"'//name3//'.png'//'"'
        WRITE(8456731,*) "replot"
     ENDIF
  ENDDO
  WRITE(8456731,*) "exit"
  CLOSE(856731)
  
  CALL EXECUTE_COMMAND_LINE("gnuplot script.gnu")
  CALL EXECUTE_COMMAND_LINE('mencoder mf://*.png -mf w=800:h=600:fps=20:type=png -ovc copy -oac copy -o video.avi'  )
  CALL EXECUTE_COMMAND_LINE("rm *.gnu  proy.*")
  
END SUBROUTINE freefall
