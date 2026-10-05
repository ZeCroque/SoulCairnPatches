;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_GrimExchange1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = SCP_MorvenQuest as SCP_MorvenQuest_MorvenQuestScript
Game.GetPlayer().RemoveItem(morvenQuestScript.GrimShard, 1)
Game.GetPlayer().AddItem(SCP_SoulGemShards, 1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SCP_MorvenQuest Auto
Form Property SCP_SoulGemShards Auto
