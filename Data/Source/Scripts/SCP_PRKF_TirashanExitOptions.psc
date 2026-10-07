;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SCP_PRKF_TirashanExitOptions Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC1VCDungeon02ToBalcony)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().MoveTo(sc_BoneyardDoor, 0.0, 100.0, 0.0, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().MoveTo(DLC1VolkiharFerryRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1VolkiharFerryRef Auto
ObjectReference Property DLC1VCDungeon02ToBalcony Auto
ObjectReference Property sc_BoneyardDoor Auto
