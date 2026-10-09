Scriptname SCP_ManagerQuest_SKPortalAliasScript extends ReferenceAlias

Event OnCellAttach()
    SCP_ManagerQuest_ManagerQuestScript ManagerQuestScript = GetOwningQuest() as SCP_ManagerQuest_ManagerQuestScript
    If(ManagerQuestScript.TirashanTeleportMarker)
        ManagerQuestScript.LoadSkyrimNonPersistentReferencesAndInit()
    EndIf
EndEvent  
