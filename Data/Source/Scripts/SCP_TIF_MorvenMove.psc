;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_MorvenMove Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    SCP_MorvenWillMove.Show()
    (SCP_MorvenQuest as SCP_MorvenQuest_MorvenQuestScript).MorvenHasMoved = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SCP_MorvenQuest Auto
Message Property SCP_MorvenWillMove Auto