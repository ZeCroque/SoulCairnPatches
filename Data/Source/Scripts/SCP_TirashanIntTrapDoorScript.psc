Scriptname SCP_TirashanIntTrapDoorScript extends ObjectReference  

ObjectReference Property SCP_TirashanBasementTrapdoorTPREF Auto

Event OnActivate(ObjectReference akActivator)
    Game.GetPlayer().MoveTo(SCP_TirashanBasementTrapdoorTPREF)
EndEvent