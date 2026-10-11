Scriptname SCP_TirashanBasementTrapdoorScript extends ObjectReference  

ObjectReference Property SCP_TirashanIntTrapDoorREF Auto

Event OnActivate(ObjectReference akActivator)
    Game.GetPlayer().MoveTo(SCP_TirashanIntTrapDoorREF)
EndEvent