Scriptname SCP_ClassicalPhylRedirectorScript extends ObjectReference  

Quest Property SCP_ManagerQuest Auto
Quest Property NecroLichRitualQuest Auto
ObjectReference Property SCP_LichPhylactery Auto

Event OnCellAttach()
    NecroLichRitualQuest = Game.GetFormFromFile(0x19EC8, "Undeath.esp") as Quest
    If(NecroLichRitualQuest.GetStage() > 60 && !SCP_LichPhylactery.IsEnabled())
        Disable()
    EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
    SCP_ManagerQuest_ManagerQuestScript managerQuest = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
    If(NecroLichRitualQuest.GetStage() > 60 && managerQuest.SCP_LichClassicalPhylacteryREF)
        If(SCP_LichPhylactery.IsEnabled())
            managerQuest.SCP_LichClassicalPhylacteryREF.Activate(akActivator)
        Else
            Disable()
        EndIf
    EndIf
EndEvent