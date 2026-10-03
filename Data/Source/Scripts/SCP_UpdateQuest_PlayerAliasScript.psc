Scriptname SCP_UpdateQuest_PlayerAliasScript extends ReferenceAlias

Event OnPlayerLoadGame()
    (GetOwningQuest() as SCP_UpdateQuest_UpdateQuestScript).Update()
EndEvent