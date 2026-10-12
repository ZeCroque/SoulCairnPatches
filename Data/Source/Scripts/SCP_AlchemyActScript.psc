Scriptname SCP_AlchemyActScript extends ObjectReference  

Quest Property SCP_ManagerQuest Auto

Event OnActivate(ObjectReference akActivator)
    SCP_ManagerQuest_ManagerQuestScript managerQuest = SCP_ManagerQuest as SCP_ManagerQuest_ManagerQuestScript
    If(managerQuest.SCP_AlchemyActivatorREF)
        managerQuest.SCP_AlchemyActivatorREF.Activate(akActivator)
    EndIf
EndEvent

