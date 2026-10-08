;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF__00_Reaper_Main_Quest_05248D93 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveCompleted(20)
SCP_MorvenQuest_MorvenQuestScript morvenQuestScript = Game.GetFormFromFile(0x3, "SoulCairnPatches.esl") as SCP_MorvenQuest_MorvenQuestScript
If(!morvenQuestScript)
	morvenQuestScript = Game.GetFormFromFile(0x3, "SoulCairnPatches.esp") as SCP_MorvenQuest_MorvenQuestScript
EndIf
If(morvenQuestScript)
    morvenQuestScript.ReapersDead = True
	morvenQuestScript.ReplacePropsIfAppropriate()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
Debug.notification("The Reaper has manifested!")
SetObjectiveCompleted(10)
setobjectivedisplayed(20)
utility.wait(1)

Objectreference spawnpoint
int currrank = deadcount.getvalue() as int

int RType = reapertype.getvalue() as int

int random = utility.randomint(0, 4)

if random == 0
spawnpoint = spawnpoint1
endif

if random == 1
spawnpoint = spawnpoint2
endif

if random == 2
spawnpoint = spawnpoint3
endif

if random == 3
spawnpoint = spawnpoint4
endif

if random == 4
spawnpoint = spawnpoint5
endif


actor Othisreaper

Reapertype.setvalue(0)
if Rtype == 1
							actorbase thisreaper = Reaperslist.getat(8) as actorbase

							Othisreaper = SpawnPoint.placeatme(thisreaper) as actor

elseif Rtype == 2
							actorbase thisreaper = Reaperslist.getat(9) as actorbase

							Othisreaper = SpawnPoint.placeatme(thisreaper) as actor


else

							actorbase thisreaper = Reaperslist.getat(currrank) as actorbase

							OThisreaper = SpawnPoint.placeatme(thisreaper) as actor


endif
SpawnPoint.placeatme(SummonEXP)
reapersound.play(game.getplayer())
OThisreaper.startcombat(Game.getplayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;debug.messagebox("Started Quest")

setobjectivedisplayed(10)
setobjectivedisplayed(11)
spawnrandom(chest1)
spawnrandom(chest2)
spawnrandom(chest3)
spawnrandom(chest4)
spawnrandom(chest5)
spawnrandom(chest6)
spawnrandom(chest7)
spawnrandom(chest8)
spawnrandom(chest9)
spawnrandom(chest10)
spawnrandom(chest11)
spawnrandom(chest12)
spawnrandom(chest13)
spawnrandom(chest14)
spawnrandom(chest15)


Spawnmarkernew1.activate(SpawnXMarker1)
SpawnXMarker1.activate(SpawnXMarker1)
SpawnXMarker2.activate(SpawnXMarker1)
SpawnXMarker3.activate(SpawnXMarker1)
SpawnXMarker4.activate(SpawnXMarker1)
SpawnXMarker5.activate(SpawnXMarker1)
SpawnXMarker6.activate(SpawnXMarker1)
SpawnXMarker7.activate(SpawnXMarker1)
SpawnXMarker8.activate(SpawnXMarker1)
SpawnXMarker9.activate(SpawnXMarker1)
SpawnXMarker10.activate(SpawnXMarker1)
SpawnXMarker11.activate(SpawnXMarker1)
SpawnXMarker12.activate(SpawnXMarker1)
SpawnXMarker13.activate(SpawnXMarker1)
SpawnXMarker14.activate(SpawnXMarker1)
SpawnXMarker15.activate(SpawnXMarker1)
SpawnXMarker16.activate(SpawnXMarker1)
SpawnXMarker17.activate(SpawnXMarker1)
SpawnXMarker18.activate(SpawnXMarker1)
SpawnXMarker19.activate(SpawnXMarker1)
SpawnXMarker20.activate(SpawnXMarker1)
SpawnXMarker21.activate(SpawnXMarker1)
SpawnXMarker22.activate(SpawnXMarker1)
SpawnXMarker23.activate(SpawnXMarker1)
SpawnXMarker24.activate(SpawnXMarker1)
gw1.enable()

gw1.resurrect()
gw1.moveto(gravemarker1)


gw2.enable()

gw2.resurrect()
gw2.moveto(gravemarker2)


gw3.enable()

gw3.resurrect()
gw3.moveto(gravemarker3)


gw4.enable()

gw4.resurrect()
gw4.moveto(gravemarker4)

If gothric.isdead()
gothric.resurrect()
gothric.moveto(gothricmarker)
endif

int offset = utility.randomint(-60, 60)
float Ndelay = delay + offset
utility.wait(Ndelay)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


float property delay auto
spell property lightning auto

objectreference property shooter1 auto
objectreference property shooter2 auto
objectreference property shooter3 auto
objectreference property shooter4 auto
objectreference property shooter5 auto
objectreference property shooter6 auto

objectreference property Chest1 auto
objectreference property Chest2 auto
objectreference property Chest3 auto
objectreference property Chest4 auto
objectreference property Chest5 auto
objectreference property Chest6 auto
objectreference property Chest7 auto
objectreference property Chest8 auto
objectreference property Chest9 auto
objectreference property Chest10 auto
objectreference property Chest11 auto
objectreference property Chest12 auto
objectreference property Chest13 auto
objectreference property Chest14 auto
objectreference property Chest15 auto

objectreference property Champ1 auto
objectreference property Champ2 auto
objectreference property Champ3 auto
objectreference property Champ4 auto
objectreference property Champ5 auto
objectreference property Champ6 auto
objectreference property Champ7 auto









objectreference property target auto
Explosion property summonexp auto

;debug.messagebox("loaded")


GlobalVariable Property DeadCount  Auto  

GlobalVariable Property Reapertype  Auto  

FormList Property ReapersList  Auto  

ObjectReference Property SpawnPoint1  Auto  

ObjectReference Property SpawnPoint2  Auto  

ObjectReference Property SpawnPoint3  Auto  

ObjectReference Property SpawnPoint4  Auto  

ObjectReference Property SpawnPoint5  Auto  


Function spawnrandom(objectreference thischest)

	thischest.disable()
	thischest.lock()
	thischest.reset()
	int random = utility.randomint(0, 100)

	int currank = deadcount.getvalue() as int

	currank = currank + 1
	
	currank = currank*spawnchance

	currank = currank + 5

	if random <= currank

	thischest.enable()

	endif

endfunction










int property spawnchance auto

actor property GW1 auto
actor property GW2 auto
actor property GW3 auto
actor property GW4 auto
actor property Gothric auto
Objectreference property Gravemarker1 auto
Objectreference property Gravemarker2 auto
Objectreference property Gravemarker3 auto
Objectreference property Gravemarker4 auto

Objectreference property GothricMarker auto

ActorBase Property Champbase  Auto  

Objectreference property SpawnXMarker1 auto
Objectreference property SpawnXMarker2 auto
Objectreference property SpawnXMarker3 auto
Objectreference property SpawnXMarker4 auto
Objectreference property SpawnXMarker5 auto
Objectreference property SpawnXMarker6 auto
Objectreference property SpawnXMarker7 auto
Objectreference property SpawnXMarker8 auto
Objectreference property SpawnXMarker9 auto
Objectreference property SpawnXMarker10 auto
Objectreference property SpawnXMarker11 auto
Objectreference property SpawnXMarker12 auto
Objectreference property SpawnXMarker13 auto
Objectreference property SpawnXMarker14 auto
Objectreference property SpawnXMarker15 auto
Objectreference property SpawnXMarker16 auto
Objectreference property SpawnXMarker17 auto
Objectreference property SpawnXMarker18 auto
Objectreference property SpawnXMarker19 auto
Objectreference property SpawnXMarker20 auto
Objectreference property SpawnXMarker21 auto
Objectreference property SpawnXMarker22 auto
Objectreference property SpawnXMarker23 auto
Objectreference property SpawnXMarker24 auto
Objectreference property SpawnXMarker25 auto

LeveledActor Property RandomActor  Auto  

Sound Property ReaperSound  Auto  

ObjectReference Property SpawnMarkerNew1  Auto  
