Scriptname SCP_ManagerQuest_PlayerAliasScript extends ReferenceAlias

SoulGem Property SCP_ReaperSoulGemFilled Auto
MiscObject Property ReaperSkull Auto

Event OnPlayerLoadGame()
    (GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript).Update()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript).GrimShard)
        SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript 
        ManagerQuestScript.SCP_GrimShardsCount.SetValueInt(ManagerQuestScript.SCP_GrimShardsCount.GetValueInt() + aiItemCount)
    ElseIf(akBaseItem == ReaperSkull)
        Actor playerREF = Game.GetPlayer()
        playerREF.RemoveItem(ReaperSkull, 1, True)
        playerREF.AddItem(((GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript).GetAlias(13) as ReferenceAlias).GetRef(), 1, True)
    ElseIf(akBaseItem == SCP_ReaperSoulGemFilled)
        Actor playerREF = Game.GetPlayer()
        playerREF.RemoveItem(SCP_ReaperSoulGemFilled, 1, True)
        playerREF.AddItem((GetOwningQuest().GetAlias(5) as ReferenceAlias).GetRef(), 1, True)
        RemoveInventoryEventFilter(SCP_ReaperSoulGemFilled)
    EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    If(akBaseItem == (GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript).GrimShard)
        SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript 
        ManagerQuestScript.SCP_GrimShardsCount.SetValueInt(ManagerQuestScript.SCP_GrimShardsCount.GetValueInt() - aiItemCount)
    EndIf
EndEvent

Function RegisterForInventoryEvents()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript     
    If(ManagerQuestScript.GrimModInstalled)
        ReaperSkull = Game.GetFormFromFile(0x756B3, "GrimmerReaper.esp") as MiscObject
        AddInventoryEventFilter(ManagerQuestScript.GrimShard)
        AddInventoryEventFilter(ReaperSkull)
    EndIf
    
    If(ManagerQuestScript.TirashanTeleportMarker)
        AddInventoryEventFilter(SCP_ReaperSoulGemFilled)
    Else
        RemoveInventoryEventFilter(SCP_ReaperSoulGemFilled)
    Endif
EndFunction