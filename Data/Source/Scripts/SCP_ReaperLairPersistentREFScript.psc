Scriptname SCP_ReaperLairPersistentREFScript extends ReferenceAlias  

Event OnCellAttach()
    (GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).LoadNonPersistentReferencesAndInit()
EndEvent