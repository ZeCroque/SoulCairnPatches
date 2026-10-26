[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-orange.json)](https://github.com/copier-org/copier)

# Soul Cairn Patches

## Index:

1. Overview
2. Details
3. Requirements
4. Known Issues
5. Mod content
6. Installation
7. Compatibility
8. My other mods
9. Credits
10. Tools used
11. Licensing/Legal 
12. Feedback

## 1. OVERVIEW

A patch that creates a smoother Soul Cairn experience by integrating together the "Morven Stroud" vanilla vendor with the "Currency Swapper" framework. It can also integrate the Tirashan house mod with the Soul Cairn and the Reaper. It can finally add a lich ritual site to the latter using the "Undeath Alternate Lichdom Paths" framework.

## 2. DETAILS

The Soul Cairn, as much as it is a great addition to the game, has always been a bit lacking for me. It has a great world design, but there's not much to do in it once you finished its main quest. This mods tries to fix this by integrating together great mods from various author, with dynamic dependencies to limit complexity and have the smallest impact on your load order.

There's two main axis:
- Add incentive to loot the Soul Cairn regularly with the "Morven Stroud" vendor
- Add convenient housing with everything a Necromancer could need

### Morven Stroud

Using the [Currency Swapper](https://www.nexusmods.com/skyrimspecialedition/mods/127686) framework, Morven Stroud has now become a regular vendor. However, because the game has an hard coded multiplier for the selling price, it no longer use Soul Husk as a currency. Instead, he takes a new misc object called "Soul Gem Shards". This new currency can be obtained against Soul Husks with the dedicated dialog options or simply looted on creatures/in treasure chests inside the Soul Cairn (requires the [Container Distribution Framework](https://www.nexusmods.com/skyrimspecialedition/mods/120152)). Additionally, if you're using the [G.R.I.M.](https://www.nexusmods.com/skyrimspecialedition/mods/41816) mod, you can exhange Grim Shards as well.

Morven sells everything he was giving up with the vanilla logic, plus:
- Alchemical items (including poison blooms, blood roots and black pearls for the lich ritual if you have the [Undeath mod](https://www.nexusmods.com/skyrimspecialedition/mods/6180) installed)
- Empty vials for the infernal alchemy if you have my mod [Undeath - Alternate Lichdom Paths]() installed
- Soul gems
- The Tirashan's teleportation spell book (if you installed the mod and have unlocked the house, see below)
- Spell books from the Necromantic Grimoire Creation if you own it.

### Housing

The housing relies on the great [Tirashan - Necromancer Home SSE by Elianora](https://www.nexusmods.com/skyrimspecialedition/mods/41257) thats adds a portal in a faraway corner of the Reach to a small personal pocket dimension. With my mod, the access has moved inside the Reaper's lair (in the Soul Cairn), meaning you will have to beat him to gain access to the house. After beating him, you'll need to get the new "Reaper's Soul Gem" by interacting with the altar, fill it with a grand soul and place it back on the altar to power up the portal.

If you use the [G.R.I.M.](https://www.nexusmods.com/skyrimspecialedition/mods/41816) mod, you will have to beat the Reaper again in its oblivion realm before interacting with the central altar. The skull altar added by this mod is also moved from the outside to the inside of the lair, and you will change the destination of the portal when interacting with it. When interacting, you'll place/remove the "Reaper Gem Skull" on/from it. The fight inside the lair will never trigger again. If you leave the Reaper's realm without looting its skull, it will be added to your inventory to make sure you're not soft-locked. It's now a quest item and weights nothing.
Everything is retroactive if you've already beaten the Reaper on your savegame.

About the house location itself now, the daedra merchant in  the entrance has been removed. You instead have the option to ask Morven Stroud to move here.

Finally, if you use my mod [Undeath Alternate Lichdom Paths](), you'll find a trap next to the staircase that leads to a new basement cell, containing:
- A Necromantic Altar to craft your Phylactery and so on
- An infernal alchemy cauldron to create Namira's Corrosion or the Embalming Essence
- An altar for placing your Phylactery and a ritual site
- A blood altar if you want the "Dark Pact" blessing
- A pedestal to place the "Whisper of the Veil" black book
- A "Bone Forge" (if you own the Gallows Hall creation)
- A chest and some goodies

### Supported languages

The mod is available in the following languages:
- English
- French

## 3. REQUIREMENTS

*For Morven Stroud trading:*
- [Currency Swapper](https://www.nexusmods.com/skyrimspecialedition/mods/127686)
- [Container Distribution Framework](https://www.nexusmods.com/skyrimspecialedition/mods/120152)
- Necromantic Grimoire (CC) [optionally]

*For the housing:*
- [Tirashan - Necromancer Home SSE](https://www.nexusmods.com/skyrimspecialedition/mods/41257)
- [Undeath Alternate Lichdom Paths]() [optionally]
- Gallows Hall (CC) [optionally]

*Other supported mods:*
- [G.R.I.M.](https://www.nexusmods.com/skyrimspecialedition/mods/41816)

## 4. KNOWN ISSUES

None. Please let me know if you find any.

## 5. MOD CONTENT

This mod consists of two main files : 
- *SoulCairnPatches.esl* (small master)
- *SoulCairnPatches.bsa*
- *SKSE/Plugins/ContainerDistributionFramework/SoulCairnPatches.json*

## 6. INSTALLATION

**Automatic (Recommended)**
- Use the Mod Manager Download button. Install and enable the file(s) in your favorite mod manager (ModOrganizer2 is my personal preference).

**Manual**
- Extract the required files (cf. `5. MOD CONTENT`) from the archive to your Data folder and activate them in the in-game Creations menu.

## 7. COMPATIBILITY

No known incompatibility. Please let me know if you find any.

## 8. MY OTHER MODS

- [Undeath - Alternate Lichdom Paths]()
- [Undeath - Shouts and Hotkeys Enabled]()
- [Prelude To Purgatory - Tweaks]()

## 9. CREDITS

- Thanks to Bethesda Softworks for this great game
- Thanks to the authors of the patched mods
- Thanks to the authors of the tools listed below
- Thanks to xtcrefugee for answering my questions about mid/small masters on the Starfield Modding Discord
- Thanks to ThreeTen for their [Spawnable Triggerboxes](https://www.nexusmods.com/skyrim/mods/61245) modding resource.
- Thanks to Betalille for their [Soul Cairn Shack - Player Home](https://www.nexusmods.com/skyrimspecialedition/mods/53596) mod which has been the template for the basement cell.

## 10. TOOLS USED

- Creation Kit
- xEdit
- Visual Studio Code
- xTranslator
- Bethesda Archive Extractor
- Champollion
- Gimp & Photopea
- Copier
 
## 11. LICENSING/LEGAL

If you want to modify and/or redistribute this mod, I would like to be contacted first please. Note that it is under GPL3 licensing, thus you have the obligation to make any modification done to the original source code available somewhere publicly.

You can find the source code [here](https://github.com/ZeCroque/SoulCairnPatches).

## 12. FEEDBACK

*Found a bug or have an idea for new features? Let me know in NexusMods' comment section or on my [Discord server](https://discord.gg/K9Jk4y2tjJ)!*

