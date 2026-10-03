;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SCP_TIF_MorvenStroudTrade Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor playerRef = Game.GetPlayer()
    If (!playerRef.HasPerk(SCP_MorvenPriceAdjustmentPerk))
        playerREF.AddPerk(SCP_MorvenPriceAdjustmentPerk)
    EndIf

    If(SCP_MorvenStroudVendorChestREF.GetItemCount(SCP_NecroGrimoirePlaceholder))
        LeveledItem necromanticGrimoires = Game.GetFormFromFile(0x947, "ccvsvsse003-necroarts.esl") as LeveledItem
        If(necromanticGrimoires)
            SCP_MorvenStroudVendorChestREF.AddItem(necromanticGrimoires, 3, True)
        EndIf
        SCP_MorvenStroudVendorChestREF.RemoveItem(SCP_NecroGrimoirePlaceholder)
        Utility.Wait(0.2)
    EndIf

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

Perk Property SCP_MorvenPriceAdjustmentPerk Auto
Form Property DLC1FoodSoulHusk Auto
ObjectReference Property SCP_MorvenStroudVendorChestREF Auto
Form Property SCP_NecroGrimoirePlaceholder Auto
