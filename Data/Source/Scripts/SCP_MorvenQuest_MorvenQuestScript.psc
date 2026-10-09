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
ObjectReference Property TirashanTeleportMarker Auto
ObjectReference Property FXDLC1SCTransportal Auto
ObjectReference Property DremoraMerchantREF Auto
ObjectReference Property SCP_TirashanDoorREF Auto
Perk Property SCP_TirashanExitOptionsPerk Auto
ObjectReference Property TirashansSkyrimPortal Auto
ObjectReference Property NorExtWallBgHenge01 Auto
Bool Property TirashanHasBeenInit Auto Conditional
Bool Property MorvenHasMoved Auto Conditional
Bool Property ReapersDead Auto

Form Property GrimShard Auto
Bool Property GrimModInstalled Auto Conditional
GlobalVariable Property SCP_GrimShardsCount Auto
ObjectReference Property _00_Reaper_Shrine Auto
ObjectReference Property SCP_ReaperShrineREF Auto
ObjectReference Property SCP_ReaperTrigREF Auto
Static Property SCP_ReaperSkullStatic Auto
ObjectReference Property SCP_ReaperSkullStaticREF Auto
MiscObject Property SCP_ReaperSkullMisc Auto

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

        If(SCP_ReaperTeleportTrigREF && SCP_ReaperTeleportTrigREF.IsEnabled())
            SCP_ModdedItemsLL.AddForm(Game.GetFormFromFile(0x1F30FB, "Tirashan.esp") as Book, 1, 1)
        EndIf

        DLC1DeathItemSoulman.AddForm(SCP_LootSoulGemShards75, 1, 1)

        DLC1SoulCairnHuskMerchant.Stop()
        DialogQuestHasBeenStopped = True
    ElseIf(DialogQuestHasBeenStopped)
        DLC1SoulCairnHuskMerchant.Start()
        DLC1SoulCairnHuskMerchant.SetStage(10)
        DialogQuestHasBeenStopped = False
    EndIf

    GrimShard = Game.GetFormFromFile(0x2111AA, "GrimmerReaper.esp")
    If(GrimShard)
        GrimModInstalled = True
        SCP_GrimShardsCount.SetValueInt(playerRef.GetItemCount(GrimShard))
    Else
        GrimModInstalled = False
        If(((GetAlias(3) as ReferenceAlias).GetRef() as Actor).IsDead())
            ReapersDead = True
        EndIf
    EndIf

    TirashanTeleportMarker = Game.GetFormFromFile(0x27434, "Tirashan.esp") as ObjectReference
    If(TirashanTeleportMarker)
        If (!playerRef.HasPerk(SCP_TirashanExitOptionsPerk))
            playerREF.AddPerk(SCP_TirashanExitOptionsPerk)
        EndIf

        ;Register OnCellAttach callback on Tirashan door
        TirashanTeleportMarker.Disable()
        (GetAlias(8) as ReferenceAlias).ForceRefTo(TirashanTeleportMarker)

        ;Register OnCellAttach callback on Tirashan's Skyrim door
        TirashansSkyrimPortal = Game.GetFormFromFile(0x2C922, "Tirashan.esp") as ObjectReference
        TirashansSkyrimPortal.Disable()
        (GetAlias(9) as ReferenceAlias).ForceRefTo(TirashansSkyrimPortal)

        (Game.GetFormFromFile(0x1F30FC, "Tirashan.esp") as ObjectReference).Disable() ;Map Marker

        LoadNonPersistentReferencesAndInit() ; This calls are here in case the user install the mod while inside the cell
        LoadTirashanNonPersistentReferencesAndInit()
        LoadSkyrimNonPersistentReferencesAndInit()
    EndIf

    (GetAlias(1) as SCP_MorvenQuest_PlayerAliasScript).RegisterForInventoryEvents()
EndFunction

Function LoadNonPersistentReferencesAndInit()
    If(!SC_alterREF)      
        SC_alterREF = Game.GetFormFromFile(0x66DE, "Dawnguard.esm") as ObjectReference        
        DLC01SoulCairnReaperAltarTrigREF = Game.GetFormFromFile(0x66E0, "Dawnguard.esm") as ObjectReference
        TeleportMarkerREF = Game.GetFormFromFile(0x13984, "Dawnguard.esm") as ObjectReference
    EndIf
    If(SC_alterREF && SC_alterREF.Is3DLoaded()) ;Try to replace only if prop loading was successful
        ReplacePropsIfAppropriate()
    EndIf
EndFunction

Function ReplacePropsIfAppropriate()
    GlobalVariable _00_Reaper_IsDead = Game.GetFormFromFile(0x2767B8, "GrimmerReaper.esp") as GlobalVariable
    If((ReapersDead || (_00_Reaper_IsDead && _00_Reaper_IsDead.GetValueInt())) && !SCP_ReaperSoulGemStaticREF)     
        DLC01SoulGemReaperFragment01REF.Disable()
        DLC01SoulGemReaperFragment02REF.Disable()
        DLC01SoulGemReaperFragment03REF.Disable()     

        SCP_ReaperSoulGemStaticREF = DLC01SoulGemReaperFragment01REF.PlaceAtMe(SCP_ReaperSoulGemStatic, 1, True)
        SCP_ReaperSoulGemStaticREF.SetAngle(0.0, 0.0, 90.0)  

        SCP_ReaperTeleportTrigREF = TeleportMarkerREF.PlaceAtMe(SCP_ReaperTeleportTrig, 1, True)
        (SCP_ReaperTeleportTrigREF as DLC01TeleportScript).teleportGoalMarker = TirashanTeleportMarker
        SCP_ReaperTeleportTrigREF.Disable()
        
        SCP_ReaperAltarTrigREF = SC_alterREF.PlaceAtMe(SCP_ReaperAltarTrig, 1, True)
        SC_alterREF.Disable()        
        
        If(GrimModInstalled)
            SCP_ReaperShrineREF = TeleportMarkerREF.PlaceAtMe(Game.GetFormFromFile(0x10DA59 ,"GrimmerReaper.esp"), 1, True)
            SCP_ReaperShrineREF.MoveTo(TeleportMarkerREF, 0.0, 700.0, 0.0)
            SCP_ReaperShrineREF.SetAngle(0.0, 0.0, -90.0)

            SCP_ReaperTrigREF.MoveTo(TeleportMarkerREF, 0.0, 680.0, 100.0)

            SCP_ReaperSkullStaticREF = TeleportMarkerREF.PlaceAtme(SCP_ReaperSkullStatic, 1, True)
            SCP_ReaperSkullStaticREF.MoveTo(TeleportMarkerREF, 0.0, 677.5, 101.0)
            SCP_ReaperSkullStaticREF.SetAngle(0.0, 0.0, 180.0)
            SCP_ReaperSkullStaticREF.SetScale(1.1)
            SCP_ReaperSkullStaticREF.Disable()
        EndIf
    EndIf
    If(_00_Reaper_IsDead && _00_Reaper_IsDead.GetValueInt() && SCP_ReaperShrineREF) ;if cell has been init and the reaper is dead
        ;Failsafe if player did not loot the skull
        Actor playerREF =  Game.GetPlayer()
        If(!playerREF.GetItemCount(SCP_ReaperSkullMisc))
            playerREF.AddItem((GetAlias(13) as ReferenceAlias).GetRef())
        EndIf

        ;Prepare lair again
        DLC01SoulCairnReaperAltarTrigREF.Disable()

        ;Prepare GRIM
        _00_Reaper_IsDead.SetValueInt(0) ;_00_Reaper_IsDead
        GlobalVariable _00_Reaper_RankGlobal = Game.GetFormFromFile(0x70564, "GrimmerReaper.esp") as GlobalVariable 
        If(_00_Reaper_RankGlobal.GetValueInt() < 7)
            _00_Reaper_RankGlobal.Mod(1.0)
        EndIf
        (Game.GetFormFromFile(0x756F0, "GrimmerReaper.esp") as Cell).Reset() ;Reset reaper's king cell
        (Game.GetFormFromFile(0xA8411, "GrimmerReaper.esp") as ObjectReference).Disable() ;Disable Gothric ally
        (Game.GetFormFromFile(0x29F27E, "GrimmerReaper.esp") as ObjectReference).Disable() ;Disable exit door
    EndIf
EndFunction

Function LoadTirashanNonPersistentReferencesAndInit()
    If(!FXDLC1SCTransportal)      
        FXDLC1SCTransportal = Game.GetFormFromFile(0x27433, "Tirashan.esp") as ObjectReference        
    EndIf
    If(FXDLC1SCTransportal && FXDLC1SCTransportal.Is3DLoaded()) ;Try to move only if prop loading was successful
        SCP_TirashanDoorREF.MoveTo(FXDLC1SCTransportal, 0.0, 0.0, 200.0)
        DremoraMerchantREF = Game.GetFormFromFile(0x89F66, "Tirashan.esp") as ObjectReference 
        DremoraMerchantREF.Disable()        
        (GetAlias(10) as ReferenceAlias).ForceRefTo(Game.GetFormFromFile(0x89F63, "Tirashan.esp") as ObjectReference) 
        TirashanHasBeenInit = True
    EndIf
    If(MorvenHasMoved)
        (GetAlias(0) as ReferenceAlias).GetRef().MoveTo(DremoraMerchantREF)
    EndIf
EndFunction

Function LoadSoulCairnNonPersistentReferencesAndInit()
    If(!_00_Reaper_Shrine)
        _00_Reaper_Shrine = Game.GetFormFromFile(0x25D1F4, "GrimmerReaper.esp") as ObjectReference
    Endif
    If(_00_Reaper_Shrine)
        _00_Reaper_Shrine.Disable()
        (Game.GetFormFromFile(0x25D1F5, "GrimmerReaper.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x25D1F7, "GrimmerReaper.esp") as ObjectReference).Disable()
    EndIf
EndFunction

Function LoadSkyrimNonPersistentReferencesAndInit()
    If(!NorExtWallBgHenge01)      
        NorExtWallBgHenge01 = Game.GetFormFromFile(0x2C91C, "Tirashan.esp") as ObjectReference        
    EndIf
    If(NorExtWallBgHenge01)
        NorExtWallBgHenge01.Disable()
        (Game.GetFormFromFile(0x2C91D, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C91E, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C91F, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C920, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C921, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C923, "Tirashan.esp") as ObjectReference).Disable()
        (Game.GetFormFromFile(0x2C924, "Tirashan.esp") as ObjectReference).Disable()
    EndIf
EndFunction
