EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("dtktdag1")~ THEN GOTO NewItem //Element's Fury +4
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @126
    IF ~!PartyHasItem("dtkfrost")~ THEN GOTO NewItem2
    IF ~PartyHasItem("dtkfrost")~ THEN GOTO NewItem3
  END

  IF ~~ THEN BEGIN NewItem2 SAY @127
    IF ~~ THEN GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NewItem3 SAY @128
    IF ~PartyGoldLT(5000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",38)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("dtktdag1",1)
                                                 TakePartyItemNum("dtkfrost",1)
                                                 DestroyItem("dtktdag1")
                                                 DestroyItem("dtkfrost")
                                                 DestroyGold(5000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @3
   COPY_TRANS WSMITH01 13
  END
END