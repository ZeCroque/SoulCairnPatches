;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_GrimExchange10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
Game.GetPlayer().RemoveItem(ManagerQuestScript.GrimShard, 10)
Game.GetPlayer().AddItem(SCP_SoulGemShards, 10000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SCP_ManagerQuest Auto
Form Property SCP_SoulGemShards Auto
