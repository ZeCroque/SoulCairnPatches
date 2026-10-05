Scriptname SCP_MorvenQuest_PlayerAliasScript extends ReferenceAlias

Event OnPlayerLoadGame()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript     
    morvenQuestScript.Update()
    If(morvenQuestScript.GrimModInstalled)
        AddInventoryEventFilter(morvenQuestScript.GrimShard)
    Else
        RemoveAllInventoryEventFilters()
    EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GrimShard)
        SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript 
        morvenQuestScript.SCP_GrimShardsCount.SetValueInt(morvenQuestScript.SCP_GrimShardsCount.GetValueInt() + aiItemCount)
    EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GrimShard)
        SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript 
        morvenQuestScript.SCP_GrimShardsCount.SetValueInt(morvenQuestScript.SCP_GrimShardsCount.GetValueInt() - aiItemCount)
    EndIf
EndEvent