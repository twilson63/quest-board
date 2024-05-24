# Quest Board

This repository contains the initial code for the Quest Board.

## Setup

```sh
npm i -g https://get_ao.g8way.io
aos myboard --load quest.lua --load quest-handlers.lua
> .load-blueprint chat
```

## Create a quest

.editor

```lua
Send({Target = ao.id, Action = "Forge", Name = "Begin", Url = "https://cookbook_ao.arweave.dev/tutorials/getting-started/index.html", Description = [[

Begin

Complete this quest to onboard into ao and aos. This journey will show you some of the core functions that you can use in your aos activites.

Once completed, Join the "Quests" Chatroom in aos DevChat and share your victory.

]], Points = "10" })
```

.done

## Register to Quests Chatroom

```lua
Join("Quests", "Quests")
Say("Hello", "Quests")
```

## Quest Board 

```
ge3fE2WaLbPYAfRIf7fRMC_R4A2_V729Yws6U0kGBy4
```


## Quest Claim Process

```
wlPvnTCY5osNDItUB4hBST_t4c4J-xtGe5CwQiwauMM
```

