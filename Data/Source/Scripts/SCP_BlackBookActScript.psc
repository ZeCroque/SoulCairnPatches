Scriptname SCP_BlackBookActScript extends ObjectReference  


ObjectReference Property SCP_BlackBookStaticREF Auto
ObjectReference Property SCP_BlackBookMarker Auto
ObjectReference Property BlackBookREF Auto
Message Property SCP_BlackBookPrompt Auto
Message Property SCP_NoBlackBookMessage Auto

Event OnActivate(ObjectReference akActivator)
    Actor playerREF = Game.GetPlayer()
    Book blackBook = Game.GetFormFromFile(0x115C59, "Undeath.esp") as Book

    If(!BlackBookREF)
        BlackBookREF = SCP_BlackBookMarker.PlaceAtMe(blackBook, 1, True)
    EndIf

    If(playerREF.GetItemCount(blackBook))
        playerREF.RemoveItem(blackBook)
        SCP_BlackBookStaticREF.Enable(True) 
    ElseIf(SCP_BlackBookStaticREF.IsEnabled())
        If(SCP_BlackBookPrompt.Show())
            BlackBookREF.Activate(playerREF)
        Else
            playerREF.AddItem(blackBook)
        EndIf
        BlackBookREF = None
        SCP_BlackBookStaticREF.Disable(True) 
    Else
        SCP_NoBlackBookMessage.Show()
    EndIf
EndEvent
