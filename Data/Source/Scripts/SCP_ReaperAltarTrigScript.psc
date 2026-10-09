Scriptname SCP_ReaperAltarTrigScript extends ObjectReference  

SoulGem Property SCP_ReaperSoulGem Auto
MiscObject Property SCP_ReaperSoulGemFilledMisc Auto
Quest Property SCP_ManagerQuest Auto
ObjectReference Property FXAmbBeamDust01REF Auto
Spell Property DLC01SC_SkyLightningBolt01 Auto
ObjectReference Property XMarker01 Auto
ObjectReference Property XMarker02 Auto
ObjectReference Property XMarker03 Auto
Message Property SCP_SoulGemLevelInsufficient Auto
Message Property SCP_PortalPowered Auto

Event OnActivate(ObjectReference akActivator)   
    Actor playerRef = Game.GetPlayer()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
    
    If(playerRef.GetItemCount(SCP_ReaperSoulGem) == 0 && playerRef.GetItemCount(SCP_ReaperSoulGemFilledMisc) == 0)       
        ManagerQuestScript.SCP_ReaperSoulGemStaticREF.Disable()        
        playerRef.AddItem((ManagerQuestScript.GetAlias(4) as ReferenceAlias).GetRef())
    Else

        If(playerRef.GetItemCount(SCP_ReaperSoulGemFilledMisc))
            ManagerQuestScript.SC_alterREF.Enable() 
            Disable()

            playerRef.RemoveItem(SCP_ReaperSoulGemFilledMisc)  
            ManagerQuestScript.SCP_ReaperSoulGemStaticREF.Enable()
            FXAmbBeamDust01REF.Enable()    

            ManagerQuestScript.SCP_ReaperTeleportTrigREF.Enable()
            ManagerQuestScript.SCP_ModdedItemsLL.AddForm(Game.GetFormFromFile(0x1F30FB, "Tirashan.esp") as Book, 1, 1)
            TriggerFXs()
            SCP_PortalPowered.Show()
        Else
            playerRef.RemoveItem(SCP_ReaperSoulGem, 1, True)    
            ObjectReference emptySoulGem = (ManagerQuestScript.GetAlias(7) as ReferenceAlias).GetRef().PlaceAtMe(SCP_ReaperSoulGem, 1, True)
            (ManagerQuestScript.GetAlias(4) as ReferenceAlias).ForceRefTo(emptySoulGem)
            playerRef.AddItem(emptySoulGem, 1, True)  

            TriggerFXs()
            SCP_SoulGemLevelInsufficient.Show()          
        EndIf
    EndIf
EndEvent

Function TriggerFXs()
    DLC01SC_SkyLightningBolt01.Cast(XMarker01, Self)
    Utility.Wait(0.25)
    DLC01SC_SkyLightningBolt01.Cast(XMarker02, Self)
    Utility.Wait(0.2)
    DLC01SC_SkyLightningBolt01.Cast(XMarker03, Self)
    Utility.Wait(0.18)
    DLC01SC_SkyLightningBolt01.Cast(XMarker01, Self)
    Utility.Wait(0.1)
    DLC01SC_SkyLightningBolt01.Cast(XMarker02, Self)
    Utility.Wait(0.1)
    DLC01SC_SkyLightningBolt01.Cast(XMarker01, Self)
    DLC01SC_SkyLightningBolt01.Cast(XMarker03, Self)
EndFunction