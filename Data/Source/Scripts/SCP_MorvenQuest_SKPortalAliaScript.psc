Scriptname SCP_MorvenQuest_SKPortalAliaScript extends ReferenceAlias

Event OnCellAttach()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(morvenQuestScript.TirashanTeleportMarker)
        morvenQuestScript.LoadSkyrimNonPersistentReferencesAndInit()
    EndIf
EndEvent  
