EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("bdblun06")~ THEN GOTO NewItem	//Uncursed Staff of Antipode
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @89
    IF ~OR(2)
          !PartyHasItem("wand05")
          !PartyHasItem("wand06")~ THEN GOTO NewItem2
    IF ~PartyHasItem("wand05")
        PartyHasItem("wand06")~ THEN GOTO NewItem3
  END

  IF ~~ THEN BEGIN NewItem2 SAY @90
    IF ~~ THEN GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NewItem3 SAY @91
    IF ~PartyGoldLT(5000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #67012 DO ~SetGlobal("CDItems","ar0334",30)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("bdblun06",1)
                                                 TakePartyItemNum("wand05",1)
                                                 TakePartyItemNum("wand06",1)
                                                 DestroyItem("bdblun06")
                                                 DestroyItem("wand05")
                                                 DestroyItem("wand06")
                                                 DestroyGold(5000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @3
   COPY_TRANS WSMITH01 13
  END
END