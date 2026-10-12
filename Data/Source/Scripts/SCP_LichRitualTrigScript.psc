Scriptname SCP_LichRitualTrigScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference akActivator)
    Quest NecroLichRitualQuest = Game.GetFormFromFile(0x19EC8, "Undeath.esp") as Quest
    If(NecroLichRitualQuest.GetStage() == 50)
        NecroLichRitualQuest.SetStage(60)
    EndIf
EndEvent