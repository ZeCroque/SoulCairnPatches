Scriptname SCP_SkullAltarTrigScript extends ObjectReference  

MiscObject Property SCP_ReaperSkullMisc Auto
Quest Property SCP_ManagerQuest Auto
Message Property SCP_ReaperChallenged Auto
Message Property SCP_ReaperChallengeCancelled Auto

Event OnActivate(ObjectReference akActivator)
    Actor playerREF = Game.GetPlayer()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
    ObjectReference teleportTrig = ManagerQuestScript.SCP_ReaperTeleportTrigREF 
    If(playerRef.GetItemCount(SCP_ReaperSkullMisc) == 1)       
        playerREF.RemoveItem(SCP_ReaperSkullMisc)
        ManagerQuestScript.SCP_ReaperSkullStaticREF.Enable() 
        (teleportTrig as DLC01TeleportScript).teleportGoalMarker = Game.GetFormFromFile(0x6B399, "GrimmerReaper.esp") as ObjectReference
        SCP_ReaperChallenged.Show()
    Else
        playerREF.AddItem((ManagerQuestScript.GetAlias(13) as ReferenceAlias).GetRef())
        ManagerQuestScript.SCP_ReaperSkullStaticREF.Disable() 
        (teleportTrig as DLC01TeleportScript).teleportGoalMarker = ManagerQuestScript.TirashanTeleportMarker
        SCP_ReaperChallengeCancelled.Show()
    EndIf
EndEvent