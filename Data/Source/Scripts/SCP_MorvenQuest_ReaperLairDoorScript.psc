Scriptname SCP_MorvenQuest_ReaperLairDoorScript extends ReferenceAlias

Event OnCellAttach()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(morvenQuestScript.GrimModInstalled)
        morvenQuestScript.LoadSoulCairnNonPersistentReferencesAndInit()
    EndIf
EndEvent  