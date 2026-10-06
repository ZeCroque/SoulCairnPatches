Scriptname SCP_ReaperAltarTrigScript extends ObjectReference  

SoulGem Property SCP_ReaperSoulGem Auto
SoulGem Property SCP_ReaperSoulGemFilled Auto
Quest Property SCP_MorvenQuest Auto
ObjectReference Property FXAmbBeamDust01REF Auto

Event OnActivate(ObjectReference akActivator)   
    Actor playerRef = Game.GetPlayer()
    SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = SCP_MorvenQuest as SCP_MorvenQuest_MorvenQuestScript
    
    If(playerRef.GetItemCount(SCP_ReaperSoulGem) == 0 && playerRef.GetItemCount(SCP_ReaperSoulGemFilled) == 0)       
        morvenQuestScript.SCP_ReaperSoulGemStaticREF.Disable()        
        playerRef.AddItem(SCP_ReaperSoulGem)
    Else
        If(playerRef.GetItemCount(SCP_ReaperSoulGemFilled))
            playerRef.RemoveItem(SCP_ReaperSoulGemFilled)          
            morvenQuestScript.SCP_ReaperSoulGemStaticREF.Enable()
            FXAmbBeamDust01REF.Enable()           
            morvenQuestScript.SC_alterREF.Enable()  
            morvenQuestScript.SCP_ReaperTeleportTrigREF.Enable()
            morvenQuestScript.SCP_ModdedItemsLL.AddForm(Game.GetFormFromFile(0x1F30FB, "Tirashan.esp") as Book, 1, 1)
            Disable()
            Debug.Trace("Portal ready")
        Else
            Debug.Trace("Soul empty or too small")
            playerRef.RemoveItem(SCP_ReaperSoulGem)
            playerRef.AddItem(SCP_ReaperSoulGem)            
        EndIf
    EndIf
EndEvent