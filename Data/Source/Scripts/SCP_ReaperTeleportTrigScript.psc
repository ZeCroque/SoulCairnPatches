Scriptname SCP_ReaperTeleportTrigScript extends ObjectReference  

Quest Property SCP_MorvenQuest Auto

Event OnTriggerEnter(ObjectReference akActivator)
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = SCP_MorvenQuest as SCP_MorvenQuest_MorvenQuestScript
	If(morvenQuestScript.GrimModInstalled && morvenQuestScript.SCP_ReaperSkullStaticREF.IsEnabled() && akActivator == Game.GetPlayer())
        morvenQuestScript.SCP_ReaperSkullStaticREF.Disable()        
        (morvenQuestScript.SCP_ReaperAltarTrigREF as SCP_ReaperAltarTrigScript).FXAmbBeamDust01REF.Disable()
        morvenQuestScript.SCP_ReaperAltarTrigREF.Enable()
        morvenQuestScript.SC_alterREF.Disable()
        Disable()
        
        Quest _00_Reaper_Main_Quest = Game.GetFormFromFile(0x248D93, "GrimmerReaper.esp") as Quest
        _00_Reaper_Main_Quest.Reset()
        _00_Reaper_Main_Quest.SetStage(10)    
    EndIf
EndEvent