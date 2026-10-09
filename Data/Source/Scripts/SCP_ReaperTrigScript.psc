Scriptname SCP_ReaperTrigScript extends ObjectReference  

MiscObject Property SCP_ReaperSkullMisc Auto
Quest Property SCP_MorvenQuest Auto
Message Property SCP_ReaperChallenged Auto
Message Property SCP_ReaperChallengeCancelled Auto

Event OnActivate(ObjectReference akActivator)
    Actor playerREF = Game.GetPlayer()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = SCP_MorvenQuest as SCP_MorvenQuest_MorvenQuestScript
    ObjectReference teleportTrig = morvenQuestScript.SCP_ReaperTeleportTrigREF 
    If(playerRef.GetItemCount(SCP_ReaperSkullMisc) == 1)       
        playerREF.RemoveItem(SCP_ReaperSkullMisc)
        morvenQuestScript.SCP_ReaperSkullStaticREF.Enable() 
        (teleportTrig as DLC01TeleportScript).teleportGoalMarker = Game.GetFormFromFile(0x6B399, "GrimmerReaper.esp") as ObjectReference
        SCP_ReaperChallenged.Show()
    Else
        playerREF.AddItem((morvenQuestScript.GetAlias(13) as ReferenceAlias).GetRef())
        morvenQuestScript.SCP_ReaperSkullStaticREF.Disable() 
        (teleportTrig as DLC01TeleportScript).teleportGoalMarker = morvenQuestScript.TirashanTeleportMarker
        SCP_ReaperChallengeCancelled.Show()
    EndIf
EndEvent