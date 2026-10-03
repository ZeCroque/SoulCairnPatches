Scriptname SCP_UpdateQuest_UpdateQuestScript extends Quest

GlobalVariable Property SCP_ModVersion  Auto
Quest Property MyQuest Auto

Event OnInit()
    Update()
EndEvent

Function Update()
    SCP_ModVersion.SetValue(SCP_Utility_ModInfo.GetModVersion())
    MyQuest.SetStage(20)
    MyQuest.SetStage(20)
EndFunction
