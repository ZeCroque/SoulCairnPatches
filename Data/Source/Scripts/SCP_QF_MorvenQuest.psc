;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SCP_QF_MorvenQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY Morven
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Morven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EmptyReaperSoulGem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EmptyReaperSoulGem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MorvenVendorSit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MorvenVendorSit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FilledReaperSoulGem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FilledReaperSoulGem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyrimPortal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyrimPortal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MorvenVendorContainerREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MorvenVendorContainerREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReaperLairPersistentREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReaperLairPersistentREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Reaper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Reaper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PORTAL
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PORTAL Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReaperLairDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReaperLairDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReaperSkull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReaperSkull Auto
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
