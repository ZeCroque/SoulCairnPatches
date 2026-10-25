Scriptname SCP_ManagerQuest_ManagerQuestScript extends Quest Conditional

; Currency Swapper
Bool Property CurrencySwapperInstalled Auto Conditional
ObjectReference Property SCP_MorvenStroudVendorChestREF Auto
LeveledItem Property SCP_ModdedItemsLL Auto
Perk Property SCP_MorvenPriceAdjustmentPerk Auto
LeveledItem Property SCP_LootSoulGemShards75 Auto
LeveledItem Property DLC1DeathItemSoulman Auto
Quest Property DLC1SoulCairnHuskMerchant Auto
Bool Property DialogQuestHasBeenStopped Auto

; Tirashan
ObjectReference Property DLC01SoulCairnReaperAltarTrigREF Auto
ObjectReference Property DLC01SoulGemReaperFragment01REF Auto
ObjectReference Property DLC01SoulGemReaperFragment02REF Auto
ObjectReference Property DLC01SoulGemReaperFragment03REF Auto
Static Property SCP_ReaperSoulGemStatic Auto
ObjectReference Property SCP_ReaperSoulGemStaticREF Auto
ObjectReference Property SC_alterREF Auto
ObjectReference Property TeleportMarkerREF Auto
Activator Property SCP_SoulGemAltarTrig Auto
ObjectReference Property SCP_SoulGemAltarTrigREF Auto
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

; Grim
Form Property GrimShard Auto
Bool Property GrimModInstalled Auto Conditional
GlobalVariable Property SCP_GrimShardsCount Auto
ObjectReference Property _00_Reaper_Shrine Auto
ObjectReference Property SCP_ReaperShrineREF Auto
ObjectReference Property SCP_SkullAltarTrigREF Auto
Static Property SCP_ReaperSkullStatic Auto
ObjectReference Property SCP_ReaperSkullStaticREF Auto
MiscObject Property SCP_ReaperSkullMisc Auto

; Undeath/Necrohouse + Tirashan
ObjectReference Property sc_mausoleumcolumn01 Auto
ObjectReference Property SCP_TirashanBasementTrapdoor Auto

ObjectReference Property SCP_BoneForgeSummonPoint Auto
ObjectReference Property SCP_BoneForgeAltarREF Auto

ObjectReference Property CraftingEnchantingWorbenchREF Auto
ObjectReference Property NecroWorkbenchREF Auto
ObjectReference Property SCP_NecroEnchanterHelperNPCMarker Auto
Actor Property SCP_NecroEnchanterHelperNPC Auto

ObjectReference Property SCP_LichRitualTrigger Auto
ObjectReference Property SCP_LichPhylactery Auto
ObjectReference Property SCP_LichPhylacteryAct Auto
ObjectReference Property SCP_LichClassicalPhylacteryREF Auto

Activator Property UAP_CauldronAct Auto
ObjectReference Property SCP_AlchemyActivatorREF Auto
ObjectReference Property SCP_NecroNightshadeStatic Auto
ObjectReference Property SCP_NecroBloodrootStatic Auto
ObjectReference Property SCP_NecroDeathbellStatic Auto
ObjectReference Property SCP_NecroHeartStatic Auto
ObjectReference Property SCP_NecroMushroomStatic Auto
ObjectReference Property NecroQuest04Skull001 Auto
ObjectReference Property SCP_PlaceholderNote Auto
ObjectReference Property UAP_AlchemyNoteREF Auto
MiscObject Property UAP_EmptyVial Auto
ObjectReference[] Property UAP_PlaceholderPotions Auto
ObjectReference[] Property UAP_EmptyVials Auto

ObjectReference Property SkyHavenBloodBowl01 Auto
ObjectReference Property NecroBloodBowlREF Auto
ObjectReference[] Property PlaceholderBanners Auto
ObjectReference[] Property NecroBanners Auto

Function Update()
    Actor playerRef = Game.GetPlayer()

    UAP_EmptyVial = Game.GetFormFromFile(0x3, "UndeathAlternateLichdomPaths.esl") as MiscObject
    If(!UAP_EmptyVial)
        UAP_EmptyVial = Game.GetFormFromFile(0x3, "UndeathAlternateLichdomPaths.esp") as MiscObject
    EndIf

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

        If(UAP_EmptyVial)
            SCP_ModdedItemsLL.AddForm(UAP_EmptyVial, 0, 5)
        EndIf

        Form bloodRoot = Game.GetFormFromFile(0x2AE804, "Undeath.esp")
        If(bloodRoot)
            SCP_ModdedItemsLL.AddForm(bloodRoot, 0, 1)
            SCP_ModdedItemsLL.AddForm( Game.GetFormFromFile(0xABA90, "Undeath.esp"), 0, 1)
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
        MiscObject ReaperSkull = Game.GetFormFromFile(0x756B3, "GrimmerReaper.esp") as MiscObject
        Int reaperSkullCount = playerREF.GetItemCount(ReaperSkull) ;If player looted Reaper's Skull(s) before installing the mod, cleaned everything up
        If(reaperSkullCount)
            playerREF.RemoveItem(ReaperSkull, reaperSkullCount, True)
            playerREF.AddItem((GetAlias(13) as ReferenceAlias).GetRef())
        EndIf
    Else
        GrimModInstalled = False
        Actor reaperRef = (GetAlias(3) as ReferenceAlias).GetRef() as Actor
        If(!reaperRef || reaperRef.IsDead())
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

        ;Register OnCellAttach callback on Tirashan Int Ref
        (GetAlias(15) as ReferenceAlias).ForceRefTo(Game.GetFormFromFile(0x1B40A0, "Tirashan.esp") as ObjectReference)

        (Game.GetFormFromFile(0x1F30FC, "Tirashan.esp") as ObjectReference).Disable() ;Map Marker

        LoadNonPersistentReferencesAndInit() ; This calls are here in case the user install the mod while inside the cell
        LoadTirashanNonPersistentReferencesAndInit()
        LoadTirashanIntNonPersistentReferencesAndInit()
        LoadSkyrimNonPersistentReferencesAndInit()
        LoadSoulCairnNonPersistentReferencesAndInit()
    EndIf

    (GetAlias(1) as SCP_ManagerQuest_PlayerAliasScript).RegisterForInventoryEvents()
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

    If(Game.GetPlayer().GetWorldSpace() != Game.GetFormFromFile(0x2E13A, "GrimmerReaper.esp"))
        GlobalVariable _00_Reaper_IsDead = Game.GetFormFromFile(0x2767B8, "GrimmerReaper.esp") as GlobalVariable
        If(_00_Reaper_IsDead && _00_Reaper_IsDead.GetValueInt() && SCP_ReaperShrineREF) ;if cell has been init and the reaper is dead
            ;Failsafe if player did not loot the skull
            Actor playerREF =  Game.GetPlayer()
            If(!playerREF.GetItemCount(SCP_ReaperSkullMisc))
                playerREF.AddItem((GetAlias(13) as ReferenceAlias).GetRef())
            EndIf

            ;Prepare lair again
            DLC01SoulCairnReaperAltarTrigREF.Disable()
            (SCP_ReaperTeleportTrigREF as DLC01TeleportScript).teleportGoalMarker = TirashanTeleportMarker

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
    EndIf

    UAP_CauldronAct = Game.GetFormFromFile(0x1, "UndeathAlternateLichdomPaths.esl") as Activator
    If(!UAP_CauldronAct)
        UAP_CauldronAct = Game.GetFormFromFile(0x1, "UndeathAlternateLichdomPaths.esp") as Activator
    EndIf
    If(UAP_CauldronAct)
        ActorBase boneman = Game.GetFormFromFile(0x863, "ccrmssse001-necrohouse.esl") as ActorBase
        If(boneman)
            ccRMSSSE001_NecroAltarScript necroAltarScript = SCP_BoneForgeAltarREF as ccRMSSSE001_NecroAltarScript
            necroAltarScript.BonemanSummon = boneman
            necroAltarScript.MistmanSummon = Game.GetFormFromFile(0x852, "ccrmssse001-necrohouse.esl") as ActorBase
            necroAltarScript.SkeletonSummon = Game.GetFormFromFile(0x873, "ccrmssse001-necrohouse.esl") as ActorBase
            necroAltarScript.WrathmanSummon = Game.GetFormFromFile(0x843, "ccrmssse001-necrohouse.esl") as ActorBase
            necroAltarScript.AltarSound = Game.GetFormFromFile(0xD8F, "ccrmssse001-necrohouse.esl") as Sound

            SCP_BoneForgeSummonPoint.Enable() ;Enable parent of all refs
        EndIf

        If(!NecroWorkbenchREF)
            ActorBase UAP_NecroAltarHelperNPC = Game.GetFormFromFile(0x8, "UndeathAlternateLichdomPaths.esl") as ActorBase
            If(!UAP_NecroAltarHelperNPC)
                UAP_NecroAltarHelperNPC = Game.GetFormFromFile(0x8, "UndeathAlternateLichdomPaths.esp") as ActorBase
            EndIf
            SCP_NecroEnchanterHelperNPC = SCP_NecroEnchanterHelperNPCMarker.PlaceAtMe(UAP_NecroAltarHelperNPC, 1, True) as Actor
            CraftingEnchantingWorbenchREF.Disable()  
            NecroWorkbenchREF = CraftingEnchantingWorbenchREF.PlaceAtMe(Game.GetFormFromFile(0xA6AB4, "Undeath.esp") as Furniture, 1, True)
            (NecroWorkbenchREF as NecroCraftingBenchScript).UAP_NecroAltarHelperNPC = SCP_NecroEnchanterHelperNPC
            
            (SCP_LichPhylacteryAct as NecroLichRitualPhylacteryActSCRIPT).Phylactery = Game.GetFormFromFile(0xA6AB3, "Undeath.esp") as MiscObject
            (SCP_LichRitualTrigger as NecroLichRitualCircleTriggerSCRIPT).NecroLichRitualQuest = Game.GetFormFromFile(0x19EC8, "Undeath.esp") as Quest            
            SCP_LichClassicalPhylacteryREF = SCP_LichRitualTrigger.PlaceAtMe(Game.GetFormFromFile(0xABA96, "Undeath.esp") as Activator, 1, True)
            
            SCP_AlchemyActivatorREF = SCP_LichRitualTrigger.PlaceAtMe(UAP_CauldronAct, 1, True)
            UAP_CauldronActivatorScript cauldronActivatorScript = SCP_AlchemyActivatorREF as UAP_CauldronActivatorScript
            cauldronActivatorScript.StaticNightshade = SCP_NecroNightshadeStatic
            cauldronActivatorScript.StaticMushroom = SCP_NecroMushroomStatic
            cauldronActivatorScript.StaticHeart = SCP_NecroHeartStatic
            cauldronActivatorScript.StaticBloodroot = SCP_NecroBloodrootStatic
            cauldronActivatorScript.StaticSkull = NecroQuest04Skull001
            cauldronActivatorScript.StaticDeathbell = SCP_NecroDeathbellStatic

            Book UAP_AlchemyNote = Game.GetFormFromFile(0x2, "UndeathAlternateLichdomPaths.esl") as Book
            If(!UAP_AlchemyNote)
                UAP_AlchemyNote = Game.GetFormFromFile(0x2, "UndeathAlternateLichdomPaths.esp") as Book
            EndIf        
            UAP_AlchemyNoteREF = SCP_PlaceholderNote.PlaceAtMe(UAP_AlchemyNote, 1, True)
            SCP_PlaceholderNote.Disable()

            Int i = 0
            While(i < UAP_PlaceholderPotions.Length)
                UAP_EmptyVials[i] = UAP_PlaceholderPotions[i].PlaceAtMe(UAP_EmptyVial, 1, True)
                UAP_PlaceholderPotions[i].Disable()
                i += 1
            EndWhile

            NecroBloodBowlREF = SkyHavenBloodBowl01.PlaceAtMe(Game.GetFormFromFile(0x3F387, "Undeath.esp"), 1, True)
            SkyHavenBloodBowl01.Disable()

            Form necroBanner = Game.GetFormFromFile(0x891E, "Undeath.esp")
            i = 0
            While(i < PlaceholderBanners.Length)
                NecroBanners[i] = PlaceholderBanners[i].PlaceAtMe(necroBanner, 1, True)
                PlaceholderBanners[i].Disable()
                i += 1
            EndWhile
        EndIf
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
        
        SCP_SoulGemAltarTrigREF = SC_alterREF.PlaceAtMe(SCP_SoulGemAltarTrig, 1, True)
        SC_alterREF.Disable()        
        
        If(GrimModInstalled)
            SCP_ReaperShrineREF = TeleportMarkerREF.PlaceAtMe(Game.GetFormFromFile(0x10DA59 ,"GrimmerReaper.esp"), 1, True)
            SCP_ReaperShrineREF.MoveTo(TeleportMarkerREF, 0.0, 700.0, 0.0)
            SCP_ReaperShrineREF.SetAngle(0.0, 0.0, -90.0)

            SCP_SkullAltarTrigREF.MoveTo(TeleportMarkerREF, 0.0, 680.0, 100.0)

            SCP_ReaperSkullStaticREF = TeleportMarkerREF.PlaceAtme(SCP_ReaperSkullStatic, 1, True)
            SCP_ReaperSkullStaticREF.MoveTo(TeleportMarkerREF, 0.0, 677.5, 101.0)
            SCP_ReaperSkullStaticREF.SetAngle(0.0, 0.0, 180.0)
            SCP_ReaperSkullStaticREF.SetScale(1.1)
            SCP_ReaperSkullStaticREF.Disable()
        EndIf
    EndIf
EndFunction

Function InitUndeathIfAppropriate()
    If(UAP_CauldronAct)
        Quest NecroLichRitualQuest = Game.GetFormFromFile(0x19EC8, "Undeath.esp") as Quest
        If(NecroLichRitualQuest.GetStage() == 10)
            NecroLichRitualQuest.SetStage(20)
            (NecroLichRitualQuest as NecroLichTrackingQuest).HasUpgrade = True
        EndIf
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

    InitUndeathIfAppropriate()
EndFunction

Function LoadTirashanIntNonPersistentReferencesAndInit()
    If(UAP_EmptyVial)
        If(!sc_mausoleumcolumn01)      
            sc_mausoleumcolumn01 = Game.GetFormFromFile(0x217A28, "Tirashan.esp") as ObjectReference        
        EndIf
        If(sc_mausoleumcolumn01 && sc_mausoleumcolumn01.Is3DLoaded()) 
            SCP_TirashanBasementTrapdoor.MoveTo(sc_mausoleumcolumn01, 77.0, 0.0, -10.0)
            SCP_TirashanBasementTrapdoor.SetScale(0.75)
            SCP_TirashanBasementTrapdoor.SetAngle(0.0, 0.0, -90.0)
        EndIf

        InitUndeathIfAppropriate()
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
