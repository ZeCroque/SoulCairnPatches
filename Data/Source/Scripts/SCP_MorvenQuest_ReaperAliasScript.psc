Scriptname SCP_MorvenQuest_ReaperAliasScript extends ReferenceAlias

Event OnDeath(Actor akKiller)
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(!morvenQuestScript.GrimModInstalled)
        morvenQuestScript.ReapersDead = True
        morvenQuestScript.ReplacePropsIfAppropriate()
    EndIf
EndEvent