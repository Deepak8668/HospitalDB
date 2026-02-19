=IF(
   AND(
      COUNTIFS($C:$C,$C2,$X:$X,"Rivilier")>0,
      OR(
         AND(
            COUNTIFS($C:$C,$C2,$X:$X,"USDHP")>0,
            COUNTIFS($C:$C,$C2,$X:$X,"USDHP",$S:$S,"<>",$T:$T,"<>")
              =
            COUNTIFS($C:$C,$C2,$X:$X,"USDHP")
         ),
         AND(
            COUNTIFS($C:$C,$C2,$X:$X,"both Rivilier and USD")>0,
            COUNTIFS($C:$C,$C2,$X:$X,"both Rivilier and USD",$S:$S,"<>",$T:$T,"<>")
              =
            COUNTIFS($C:$C,$C2,$X:$X,"both Rivilier and USD")
         )
      )
   ),
   "KEEP",
   "REMOVE"
)