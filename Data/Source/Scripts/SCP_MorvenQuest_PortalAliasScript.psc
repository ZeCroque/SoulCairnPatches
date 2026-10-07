Scriptname SCP_MorvenQuest_PortalAliasScript extends ReferenceAlias

Event OnCellAttach()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(morvenQuestScript.TirashanTeleportMarker)
        morvenQuestScript.LoadTirashanNonPersistentReferencesAndInit()
    EndIf
EndEvent