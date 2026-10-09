Scriptname SCP_ReaperLairPersistentREFScript extends ReferenceAlias  

MiscObject Property SCP_ReaperSkullMisc Auto

Event OnCellAttach()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript
    If(morvenQuestScript.TirashanTeleportMarker)
        morvenQuestScript.LoadNonPersistentReferencesAndInit()
    EndIf
    If(morvenQuestScript.GrimModInstalled)
        Actor playerREF =  Game.GetPlayer()
        If((Game.GetFormFromFile(0x2767B8, "GrimmerReaper.esp") as GlobalVariable).GetValueInt() && !playerREF.GetItemCount(SCP_ReaperSkullMisc))
            playerREF.AddItem(((GetOwningQuest() as SCP_MorvenQuest_MorvenQuestScript).GetAlias(13) as ReferenceAlias).GetRef())
        EndIf
    EndIf
EndEvent