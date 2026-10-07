Scriptname SCP_MorvenQuest_PlayerAliasScript extends ReferenceAlias

SoulGem Property SCP_ReaperSoulGemFilled Auto

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
    ElseIf(akBaseItem == SCP_ReaperSoulGemFilled)
        Actor playerREF = Game.GetPlayer()
        playerREF.RemoveItem(SCP_ReaperSoulGemFilled, 1, True)
        playerREF.AddItem((GetOwningQuest().GetAlias(5) as ReferenceAlias).GetRef(), 1, True)
        RemoveInventoryEventFilter(SCP_ReaperSoulGemFilled)
    EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GrimShard)
        SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript 
        morvenQuestScript.SCP_GrimShardsCount.SetValueInt(morvenQuestScript.SCP_GrimShardsCount.GetValueInt() - aiItemCount)
    EndIf
EndEvent

Function RegisterForReapersFilledSoulGem()
    AddInventoryEventFilter(SCP_ReaperSoulGemFilled)
EndFunction