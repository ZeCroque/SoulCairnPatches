;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_MorvenStroudTrade Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    SEA_BarterFunctions.SetCurrency(DLC1FoodSoulHusk)
    (akSpeakerRef as Actor).ShowBarterMenu()

	;Skyrim Souls compatibility
	While(Utility.IsInMenuMode())
		Utility.Wait(0.1)
	EndWhile
    
    SEA_BarterFunctions.ResetCurrency()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Form Property DLC1FoodSoulHusk Auto
