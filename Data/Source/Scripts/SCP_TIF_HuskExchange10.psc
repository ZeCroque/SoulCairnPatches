;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_HuskExchange10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC1FoodSoulHusk, 10)
Game.GetPlayer().AddItem(SCP_SoulGemShards, 500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Form Property DLC1FoodSoulHusk Auto
Form Property SCP_SoulGemShards Auto
