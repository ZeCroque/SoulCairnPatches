Scriptname SCP_MorvenQuest_MorvenQuestScript extends Quest Conditional

Bool Property CurrencySwapperInstalled Auto Conditional
ObjectReference Property SCP_MorvenStroudVendorChestREF Auto
LeveledItem Property SCP_ModdedItemsLL Auto
Perk Property SCP_MorvenPriceAdjustmentPerk Auto
LeveledItem Property SCP_LootSoulGemShards75 Auto
LeveledItem Property DLC1DeathItemSoulman Auto
Quest Property DLC1SoulCairnHuskMerchant Auto
Bool Property DialogQuestHasBeenStopped Auto

ObjectReference Property DLC01SoulCairnReaperAltarTrigREF Auto
ObjectReference Property DLC01SoulGemReaperFragment01REF Auto
ObjectReference Property DLC01SoulGemReaperFragment02REF Auto
ObjectReference Property DLC01SoulGemReaperFragment03REF Auto
Static Property SCP_ReaperSoulGemStatic Auto
ObjectReference Property SCP_ReaperSoulGemStaticREF Auto
ObjectReference Property SC_alterREF Auto
ObjectReference Property TeleportMarkerREF Auto
Activator Property SCP_ReaperAltarTrig Auto
ObjectReference Property SCP_ReaperAltarTrigREF Auto
Activator Property SCP_ReaperTeleportTrig Auto
ObjectReference Property SCP_ReaperTeleportTrigREF Auto

Form Property GrimShard Auto
Bool Property GrimModInstalled Auto Conditional
GlobalVariable Property SCP_GrimShardsCount Auto

Function Update()
    Actor playerRef = Game.GetPlayer()

    CurrencySwapperInstalled = SEA_BarterFunctions.SetCurrency(Game.GetForm(0x104B3F)) ;Fork misc item, just for testing purpose, it will return true if the mod is installed
    SEA_BarterFunctions.ResetCurrency()
    If(CurrencySwapperInstalled)
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

        DLC1SoulCairnHuskMerchant.Stop()
        DialogQuestHasBeenStopped = True
    ElseIf(DialogQuestHasBeenStopped)
        DLC1SoulCairnHuskMerchant.Start()
        DLC1SoulCairnHuskMerchant.SetStage(10)
        DialogQuestHasBeenStopped = False
    EndIf

    LoadNonPersistentReferencesAndInit() ; This call is here in case the user install the mod while inside the cell

    GrimShard = Game.GetFormFromFile(0x2111AA, "GrimmerReaper.esp")
    If(GrimShard)
        GrimModInstalled = True
        SCP_GrimShardsCount.SetValueInt(playerRef.GetItemCount(GrimShard))
    Else
        GrimModInstalled = False
    EndIf
EndFunction

Function LoadNonPersistentReferencesAndInit()
    If(!SC_alterREF)      
        SC_alterREF = Game.GetFormFromFile(0x66DE, "Dawnguard.esm") as ObjectReference        
        DLC01SoulCairnReaperAltarTrigREF = Game.GetFormFromFile(0x66E0, "Dawnguard.esm") as ObjectReference
        TeleportMarkerREF = Game.GetFormFromFile(0x13984, "Dawnguard.esm") as ObjectReference

        If(SC_alterREF) ;Try to replace only if prop loading was successful
            ReplacePropsIfAppropriate()
        EndIf
    EndIf
EndFunction

Function ReplacePropsIfAppropriate()
    If(!DLC01SoulCairnReaperAltarTrigREF.IsEnabled() && (!SCP_ReaperSoulGemStaticREF || !SCP_ReaperSoulGemStaticREF.IsEnabled()))
        DLC01SoulGemReaperFragment01REF.Disable()
        DLC01SoulGemReaperFragment02REF.Disable()
        DLC01SoulGemReaperFragment03REF.Disable()     

        SCP_ReaperSoulGemStaticREF = DLC01SoulGemReaperFragment01REF.PlaceAtMe(SCP_ReaperSoulGemStatic, 1, True)
        SCP_ReaperSoulGemStaticREF.SetAngle(0.0, 0.0, 90.0)  

        SCP_ReaperTeleportTrigREF = TeleportMarkerREF.PlaceAtMe(SCP_ReaperTeleportTrig, 1, True)
        (SCP_ReaperTeleportTrigREF as DLC01TeleportScript).teleportGoalMarker = Game.GetFormFromFile(0x1B40A0, "Tirashan.esp") as ObjectReference
        SCP_ReaperTeleportTrigREF.Disable()
        
        SCP_ReaperAltarTrigREF = SC_alterREF.PlaceAtMe(SCP_ReaperAltarTrig, 1, True)
        SC_alterREF.Disable()            
    EndIf
EndFunction