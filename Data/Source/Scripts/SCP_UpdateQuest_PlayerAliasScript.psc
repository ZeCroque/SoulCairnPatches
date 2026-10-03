Scriptname SCP_UpdateQuest_PlayerAliasScript extends ReferenceAlias

Quest Property test Auto

Event OnPlayerLoadGame()
    (GetOwningQuest() as SCP_UpdateQuest_UpdateQuestScript).Update()
    (GetOwningQuest() as SCP_UpdateQuest_UpdateQuestScript).Update()
    test.CompleteQuest()
EndEvent