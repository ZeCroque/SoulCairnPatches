Scriptname SCP_ReaperTeleportTrigScript extends ObjectReference  

Quest Property SCP_ManagerQuest Auto

Event OnTriggerEnter(ObjectReference akActivator)
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
	If(ManagerQuestScript.GrimModInstalled && ManagerQuestScript.SCP_ReaperSkullStaticREF.IsEnabled() && akActivator == Game.GetPlayer())
        ManagerQuestScript.SCP_ReaperSkullStaticREF.Disable()        
        (ManagerQuestScript.SCP_ReaperAltarTrigREF as SCP_ReaperAltarTrigScript).FXAmbBeamDust01REF.Disable()
        ManagerQuestScript.SCP_ReaperAltarTrigREF.Enable()
        ManagerQuestScript.SC_alterREF.Disable()
        Disable()
        
        Quest _00_Reaper_Main_Quest = Game.GetFormFromFile(0x248D93, "GrimmerReaper.esp") as Quest
        _00_Reaper_Main_Quest.Reset()
        _00_Reaper_Main_Quest.SetStage(10)    
    EndIf
EndEvent