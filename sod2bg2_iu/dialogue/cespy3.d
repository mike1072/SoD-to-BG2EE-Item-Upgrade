// extend cespenar's generic item search with cromwell's items
EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("bdboot01")~ THEN GOTO NewItemCespy // Quicksilver Sabatons
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN NewItemCespy SAY @1008
    IF ~!PartyHasItem("compon01")~ THEN GOTO need_NewItemCespy
    IF ~PartyHasItem("compon01")~ THEN GOTO NewItemCespy_want
  END

  IF ~~ THEN BEGIN need_NewItemCespy SAY @1009
    COPY_TRANS BOTSMITH 4
  END

  IF ~~ THEN BEGIN NewItemCespy_want SAY @1010
    IF ~PartyGoldLT(7500)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(7499)~ THEN REPLY #66909 DO ~SetGlobal("DTKItemsCespy","GLOBAL",3)
                                                 TakePartyGold(7500)
                                                 TakePartyItemNum("bdboot01",1)
                                                 DestroyItem("bdboot01")
                                                 TakePartyItemNum("compon01",1)
                                                 DestroyItem("compon01")
                                                 DestroyGold(7500)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO NewItemCespy_stall
  END

  IF ~~ THEN BEGIN NewItemCespy_stall SAY @1011
    COPY_TRANS BOTSMITH 4
  END

END                                            
