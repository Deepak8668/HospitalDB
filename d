=IF(
   OR(
      COUNTIFS($C:$C,$C2,$X:$X,"both Reveleer and UST")>0,
      AND(
         COUNTIFS($C:$C,$C2,$X:$X,"Reveleer")>0,
         COUNTIFS($C:$C,$C2,$X:$X,"USTHP")>0
      )
   ),
   "Keep",
   ""
)