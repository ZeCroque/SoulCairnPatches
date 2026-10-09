Scriptname SCP_ManagerQuest_ReaperAliasScript extends ReferenceAlias

Event OnDeath(Actor akKiller)
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript
    If(!ManagerQuestScript.GrimModInstalled)
        ManagerQuestScript.ReapersDead = True
        ManagerQuestScript.ReplacePropsIfAppropriate()
    EndIf
EndEvent