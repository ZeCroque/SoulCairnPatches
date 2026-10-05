Scriptname SCP_MorvenQuest_MorvenQuestScript extends Quest Conditional

ObjectReference Property SCP_MorvenStroudVendorChestREF Auto
LeveledItem Property SCP_ModdedItemsLL Auto
Perk Property SCP_MorvenPriceAdjustmentPerk Auto
LeveledItem Property SCP_LootSoulGemShards75 Auto
LeveledItem Property DLC1DeathItemSoulman Auto

Form Property GrimShard Auto
Bool Property GrimModInstalled Auto Conditional
GlobalVariable Property SCP_GrimShardsCount Auto

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

    DLC1DeathItemSoulman.AddForm(SCP_LootSoulGemShards75, 1, 1)

    GrimShard = Game.GetFormFromFile(0x2111AA, "GrimmerReaper.esp")
    If(GrimShard)
        GrimModInstalled = True
        SCP_GrimShardsCount.SetValueInt(playerRef.GetItemCount(GrimShard))
    Else
        GrimModInstalled = False
    EndIf
EndFunction
