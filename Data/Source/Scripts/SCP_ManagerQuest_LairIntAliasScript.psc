Scriptname SCP_ManagerQuest_LairIntAliasScript extends ReferenceAlias  

Event OnCellAttach()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript
    If(ManagerQuestScript.TirashanTeleportMarker)
        ManagerQuestScript.LoadNonPersistentReferencesAndInit()
    EndIf
EndEvent