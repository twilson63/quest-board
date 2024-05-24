local sqlite3 = require('lsqlite3')
local DbAdmin = require('dbadmin')

db = db or sqlite3.open_memory()
dbAdmin = dbAdmin or DbAdmin.new(db)

local CLAIMS_SCHEMA = [[
  CREATE TABLE IF NOT EXISTS Claims (
    ID INT PRIMARY KEY,
    Process TEXT NOT NULL,
    Github TEXT NOT NULL,
    Url TEXT NOT NULL,
    Quest TEXT NOT NULL,
    Status TEXT NOT NULL,
    Updated INT
  );  
]]

function InitDB() 
  db:exec(CLAIMS_SCHEMA)
  return "ok"

end

local Claims = {
  isSubmit = function (msg)
    return msg.Action == "Submit-Claim"
  end,
  add = function (msg)
    if not msg.Github then
      Send({Target = msg.From, Action = "Claim-Assert", Data = "Github username is required!"})
      return "ok"
    end


    if not msg.SourceUrl then
      Send({Target = msg.From, Action = "Claim-Assert", Data = "SourceUrl is required!"})
      return "ok"
    end

    if not msg.Quest then
      Send({Target = msg.From, Action = "Claim-Assert", Data = "Quest is required!"})
      return "ok"
    end
    


    local claims = dbAdmin:exec(
      string.format([[
        select * from Claims where Quest = "%s" and Github = "%s";
      ]], msg.Quest, msg.Github)
    )
    if #claims > 0 then
      Send({ Target = msg.From, Action = "Claim-Response", Data = "Already submitted claim for this quest."})
      print("Already submitted claim")
      return "ok"
    end
    local sql = string.format([[
      insert into Claims (Process, Github, Url, Quest, Status, Updated)
      values ("%s", "%s", "%s", "%s", "%s", %d);
    ]], msg.From, msg.Github, msg.SourceUrl, msg.Quest, "pending", msg.Timestamp)

    dbAdmin:exec(sql)
    Send({
        Target = msg.From,
        Action = "Claim-Notice",
        Data = "Successfully added Claim"
    })
    print("Successfully added Claim for: " .. msg.Github)
  end,
  isGet = function(msg) 
    return msg.Action == "Get-Claim"
  end,
  get = function (msg)
    local sql = string.format([[
    select * from Claims where Github = "%s";
    ]], msg.Github)

    local result = dbAdmin:exec(sql)
    
    Send({ Target = msg.From,
      Action = "Get-Claim-Response",
      Data = require('json').encode(result)
    })
    
    print(result)
  end
}

Handlers.add("Submit-Claim", Claims.isSubmit, Claims.add)
Handlers.add("Get-My-Claims", Claims.isGet, Claims.get)


