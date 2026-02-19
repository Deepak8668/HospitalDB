=IF(
   AND(
      COUNTIFS($C:$C,$C2,$X:$X,"Reveler")>0,
      OR(
         COUNTIFS($C:$C,$C2,$X:$X,"USTHP",$S:$S,"<>",$T:$T,"<>")>0,
         COUNTIFS($C:$C,$C2,$X:$X,"both Reveleer and UST",$S:$S,"<>",$T:$T,"<>")>0
      )
   ),
   "KEEP",
   "REMOVE"
)