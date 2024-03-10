Send({ Target = ao.id, Action = "Forge", Name = "Orbit:News-Feed-Bot", 
  CRED = "500.000 (OP)",
  Url = "",
  Description = [[

A Cron-bot that will post the latest news every 4 hours. The bot will be 
evaluated based on the live demo and the codebase. Submit a PR here: 
https://github.com/0rbit-co/quest with the Name=news-feed-bot-${username} 
and with the codebase and demo link in the description.

Points: After the successful evaluation, 500 OP (0rbit Points) will be awarded 
to PR. Check the below URL for more info.

Url: To gather more information about this quest, 
visit https://github.com/0rbit-co/quest/blob/main/news-feed-bot.md

  ]]
})


Send({ Target = ao.id, Action = "Forge", Name = "Orbit:Price-Feed-Bot", 
  CRED = "200.000 (OP)",
  Url = "",
  Description = [[

Create a bot for the chatroom that will provide the price feed for a token(s) 
when the users ask. The bot will be evaluated based on the live demo and 
the codebase. 

Submit a PR here: https://github.com/0rbit-co/quest with the Name=`price-feed-bot-${username}` 
and with the codebase and demo link in the description.
    
    
Points: 200 OP (0rbit Points) will be awarded to PR after the successful evaluation. Check 
the below URL for more info.
    
URL: To gather more information about this quest, 
visit https://github.com/0rbit-co/quest/blob/main/price-feed-bot.md
    
  ]]
})

-- Send({ Target = ao.id, Action = "Forge", Name = "Launch-a-MemeFrame", 
--   CRED = "1000.000",
--   Url = "",
--   Description = [[

-- MemeFrames are permaweb pages with a DAO inside. Once you launch a 
-- MemeFrame, anyone can deposit testnet $CRED to mint the DAOs native 
-- token until the cap is reached (1,000 $CRED by default). After minting, 
-- token holders can vote to change the contents of their permaweb page. 
-- Add an ARNS name to it and you have a community controlled site/app.

-- The MemeFrame DAO also retains the treasury of $CRED tokens used in 
-- minting. Token holders can vote to use (and grow) these however they like.
  
-- This quest is to create a memeframe with an initial page, add an ARNS name, 
-- recruit your $CRED-holding friends, and sell out the initial mint.
  
-- After you have made your memeframe you can chat to other weavers about it in 
-- the native 'Getting-Started' ao chat, or on the #memeframe-chat channel on the 
-- ao Discord. If you need help getting test $IO tokens to register your ARNS name 
-- ping a mod on the Discord.
  
-- You can make your MemeFrame themed about anything -- dogs, cats, misspelled presidents 
-- or anything else you find funny. Go as wild, degenerate, or sophisticated as you please.
  
-- You can find all of the info you need in order to start your MemeFrame on the Github: 
  
-- https://github.com/permaweb/memeframes
  
-- CRED: 1,000,000
  
-- To submit: 
  
  
-- - Publish a screenshot of your memeframe in the discord
-- - Share Instructions on how to get memeframe tokens
-- - Share Instructions on how to stake your tokens
-- - Share Instructions on how to vote
-- - Submit your MemeFrame Link and PID to the Quests Channel in Discord
-- - Must have 5 aos Users Staking your MemeFrame
  
--   ]]
-- })

-- Send({ Target = ao.id, Action = "Forge", Name = "Discord-DevChat", 
--   CRED = "3000.000",
--   Url = "",
--   Description = [[

-- Discord - ao DevChat

-- The ao computer has native chatrooms. We also have a community Discord server. 
-- This quest is to build a relay that posts the messages from each side to the 
-- other, creating a two-way bridge so that you people can chat in whatever form 
-- is most comfortable to them.

-- Resources: 
  
-- - https://github.com/samcamwilliams/DevChat
-- - https://discord.com/developers/docs/reference
  
-- How to claim:

-- Reach out on Quest Discord channel. We will need instructions
-- to setup and we will connect the ao discord to ao devchat

--   ]]
-- })

-- Send({ Target = ao.id, Action = "Forge", Name = "aos-UI", 
--   CRED = "3000.000",
--   Url = "",
--   Description = [[
    
-- Build UI for aos terminals
  
-- $CRED: 3,000

-- aos terminals allow users to build processes flexibly inside ao. They also 
-- provide a simple terminal that allows you to watch what is happening with 
-- a process inside the network. Just like SmartWeave, ao lets you build 
-- 'atomic assets': smart contracts + browser renderable data + metadata, bundled 
-- together under a single Arweave data item and ID. All you need to do to create 
-- an atomic asset in ao is add your intended browser renderable content as its data body.
  
-- This quest is to build a permaweb app that can be attached as the body of new processes, 
-- allowing the console to be rendered in the browser. This would allow any user to see what 
-- is happening inside the ao computer easily, without even installing aos locally. 
-- For example, by accessing https://arweave.dev/[PROCESS_ID] .
  
-- Bonus $CRED will be given if the process is able to specify a simple 'UI' that is 
-- rendered on the page. This could look to the user similar to Telegram bots or Farcaster 
-- Frames, letting the developer quickly prototype apps and send them to people, without 
-- needing to build a formal UI directly.

--   ]]
-- })

-- Send({ Target = ao.id, Action = "Forge", Name = "Build-Arena-Game", 
--   CRED = "1500.000",
--   Url = "",
--   Description = [[
    
-- Build a new arena game and build up a player base
  
-- $CRED: 1,500

-- aos includes a blueprint that allows you to easily build games in 
-- which autonomous bots play against each each other to win tokens. 
-- You can learn more about arena blueprint 
-- here: https://cookbook_ao.g8way.io/tutorials/bots-and-games/index.html

-- This quest is to build a new type of arena and game, then to gain a small 
--   player base (>10 other weavers) for the game.

-- Resourses:
--   - Arena Blueprint - https://github.com/permaweb/aos/blob/main/blueprints/arena.lua
--   - AO-Effect Example - https://github.com/twilson63/ao-effect

-- To Claim this quest, please post a link or the code of your game to the Quest
-- Build-a-Game Thread in discord.

--   ]]
-- })

-- Send({ Target = ao.id, Action = "Forge", Name = "Build-a-Bot", 
--   CRED = "1000.000",
--   Url = "https://cookbook_ao.g8way.io/tutorials/bots-and-games/index.html",
--   Description = [[
    
-- Build a novel autonomous bot for the ao-effect arena

-- ao-effect is an arena where autonomous agents living inside the 
-- computer battle in order to win testnet CRED from one another. 
-- Each bot stakes a token to take part in a round, and those that 
-- eliminate other bots get to claim their tokens.

-- To qualify for this quest, build and launch a new custom bot for the arena!

-- Game = "KHruEP5dOP_MgNHava2kEPleihEc915GlRRr3rQ5Jz4"
-- Send({Target = Game, Action = "RequestTokens"})
-- Send({Target = Game, Action = "Register"})

-- Post your bot source code in the #Build-a-Bot Discord Thread under Quests

-- NOTE: This challenge not only requires coding skills but you want to understand
-- the ao-effect game and how to implement strategies.

-- See the example: https://cookbook_ao.g8way.io/tutorials/bots-and-games/index.html
--   ]]
-- })

-- Send({ Target = ao.id, Action = "Forge", Name = "Bots-and-Games", 
--   CRED = "500.000",
--   Url = "https://cookbook_ao.g8way.io/tutorials/bots-and-games/index.html",
--   Description = [[
--     Leveraging insights from our previous chapter, this section will guide
--     you through the realm of automation with bots in aos and the construction 
--     of games. You will learn to create autonomous agents, using them to 
--     navigate and interact with game environments effectively.

--     CRED: 500.000

--     Once your bot complete one game in this arena:

--     Game = "KHruEP5dOP_MgNHava2kEPleihEc915GlRRr3rQ5Jz4"
--     Send({Target = Game, Action = "RequestTokens"})
--     Send({Target = Game, Action = "Register"})

--     You will receive your Quest Reward.
--   ]]
-- })