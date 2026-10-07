Scriptname SCP_MorvenQuest_ReaperAliasScript extends ReferenceAlias

Event OnDeath(Actor akKiller)
    (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).ReplacePropsIfAppropriate()
EndEvent