Scriptname SCP_MorvenQuest_PlayerAliasScript extends ReferenceAlias

SoulGem Property SCP_ReaperSoulGemFilled Auto
MiscObject Property ReaperSkull Auto

Event OnPlayerLoadGame()
    (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).Update()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GrimShard)
        SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript 
        morvenQuestScript.SCP_GrimShardsCount.SetValueInt(morvenQuestScript.SCP_GrimShardsCount.GetValueInt() + aiItemCount)
    ElseIf(akBaseItem == ReaperSkull)
        Actor playerREF = Game.GetPlayer()
        playerREF.RemoveItem(ReaperSkull, 1, True)
        playerREF.AddItem(((GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GetAlias(13) as ReferenceAlias).GetRef(), 1, True)
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

Function RegisterForInventoryEvents()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript     
    If(morvenQuestScript.GrimModInstalled)
        ReaperSkull = Game.GetFormFromFile(0x756B3, "GrimmerReaper.esp") as MiscObject
        AddInventoryEventFilter(morvenQuestScript.GrimShard)
        AddInventoryEventFilter(ReaperSkull)
    EndIf
    
    If(morvenQuestScript.TirashanTeleportMarker)
        AddInventoryEventFilter(SCP_ReaperSoulGemFilled)
    Else
        RemoveInventoryEventFilter(SCP_ReaperSoulGemFilled)
    Endif
EndFunction