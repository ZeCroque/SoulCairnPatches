Scriptname SCP_MorvenQuest_MorvenQuestScript extends Quest

ObjectReference Property SCP_MorvenStroudVendorChestREF Auto
LeveledItem Property SCP_ModdedItemsLL Auto
Perk Property SCP_MorvenPriceAdjustmentPerk Auto

Function Update()
    Actor playerRef = Game.GetPlayer()
    If (!playerRef.HasPerk(SCP_MorvenPriceAdjustmentPerk))
        playerREF.AddPerk(SCP_MorvenPriceAdjustmentPerk)
    EndIf

    SCP_ModdedItemsLL.Revert()
    
    LeveledItem necromanticGrimoires = Game.GetFormFromFile(0x947, "ccvsvsse003-necroarts.esl") as LeveledItem
    If(necromanticGrimoires)
        SCP_ModdedItemsLL.AddForm(necromanticGrimoires, 1, 3)
    EndIf

    Book tirashanTPSpellbook = Game.GetFormFromFile(0x1F30FB, "Tirashan.esp") as Book
    If(tirashanTPSpellbook)
        SCP_ModdedItemsLL.AddForm(tirashanTPSpellbook, 1, 1)
    EndIf    
EndFunction
