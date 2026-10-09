Scriptname SCP_ManagerQuest_LairExtAliasScript extends ReferenceAlias

Event OnCellAttach()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript
    If(ManagerQuestScript.GrimModInstalled)
        ManagerQuestScript.LoadSoulCairnNonPersistentReferencesAndInit()
    EndIf
EndEvent  