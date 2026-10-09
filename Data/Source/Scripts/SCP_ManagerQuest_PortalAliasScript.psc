Scriptname SCP_ManagerQuest_PortalAliasScript extends ReferenceAlias

Event OnCellAttach()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript
    If(ManagerQuestScript.TirashanTeleportMarker)
        ManagerQuestScript.LoadTirashanNonPersistentReferencesAndInit()
    EndIf
EndEvent