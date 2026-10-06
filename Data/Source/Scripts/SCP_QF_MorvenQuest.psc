;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SCP_QF_MorvenQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY ReaperLairPersistentREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReaperLairPersistentREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Morven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Morven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MorvenVendorContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MorvenVendorContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE SCP_MorvenQuest_MorvenQuestScript
Quest __temp = self as Quest
SCP_MorvenQuest_MorvenQuestScript kmyQuest = __temp as SCP_MorvenQuest_MorvenQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.Update()
kMyQuest.SCP_MorvenStroudVendorChestREF.Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
