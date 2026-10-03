Scriptname SCP_UpdateQuest_UpdateQuestScript extends Quest

GlobalVariable Property SCP_ModVersion  Auto

Event OnInit()
    Update()
EndEvent

Function Update()
    SCP_ModVersion.SetValue(SCP_Utility_ModInfo.GetModVersion())
EndFunction
