Scriptname SCP_MorvenQuest_PlayerAliasScript extends ReferenceAlias

Event OnPlayerLoadGame()
    (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).Update()
EndEvent