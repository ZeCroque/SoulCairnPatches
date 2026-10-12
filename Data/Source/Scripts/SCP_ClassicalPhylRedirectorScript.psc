Scriptname SCP_ClassicalPhylRedirectorScript extends ObjectReference  

Quest Property SCP_ManagerQuest Auto

Event OnActivate(ObjectReference akActivator)
    SCP_ManagerQuest_ManagerQuestScript managerQuest = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
    If(managerQuest.SCP_LichClassicalPhylacteryREF)
        managerQuest.SCP_LichClassicalPhylacteryREF.Activate(akActivator)
    EndIf
EndEvent