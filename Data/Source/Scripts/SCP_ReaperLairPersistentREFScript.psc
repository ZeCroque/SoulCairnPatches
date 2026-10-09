Scriptname SCP_ReaperLairPersistentREFScript extends ReferenceAlias  

Event OnCellAttach()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(morvenQuestScript.TirashanTeleportMarker)
        morvenQuestScript.LoadNonPersistentReferencesAndInit()
    EndIf
EndEvent