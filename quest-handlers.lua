Claims = Claims or {}

function AddClaim(Quest, Address, Nickname)
  table.insert(Claims, {
    Name = Quest,
    Address = Address,
    Nickname = Nickname
  })
end

Handlers.prepend("List-Quests", function (Msg)
  return Msg.Action == "Broadcasted" and Msg.Data == "/Quests" and "continue"
end, function (Msg)
  generateList()
  ao.send({Target = Msg.From, Action = "Broadcast", Data = Colors.green .. "\n\nQuests \n\n" .. Colors.reset .. printlist(listForUser) })
end)

Handlers.add("Claim-Quest", Handlers.utils.hasMatchingTag("Action", "Claim"),
  function (M) 
    assert(type(M.Name) == 'string', 'Quest Name is required!')
    if Utils.find(function (quest) return quest.Name == M.Name end, quests) and
      not Utils.find(function (claim) return claim.Address == M.From end, Claims) then

      AddClaim(M.Name, M.From)
      print('Claim Added')
      ao.send({Target = M.From, Data = "Claim received."})
    else
      print('quest not found')
      ao.send({Target = M.From, Data = Colors.red .. "Claim not found or already claimed!" .. Colors.reset})
    end
  end
)

Handlers.prepend("Claim-Quest-via-chat", function (M) 
  if M.Action == "Broadcasted" then
    local pattern = "^/Quests:Claim:(%w+)"
    local match = string.match(M.Data, pattern)
    if match then
      return "continue"
    end
  end
  return false
end, function (M) 
  local Quest = string.match(M.Data, "^/Quests:Claim:(%w+)")
  if Utils.find(function (quest) return quest.Name == Quest end, quests) and
    not Utils.find(function (claim) return claim.Address == M.Broadcaster end, Claims) then
    AddClaim(Quest, M.Broadcaster, M.Nickname)
    print('Claim Added')
    ao.send({Target = M.From, Action = "Broadcast", Data = "Claim received."})
  else 
    print("Claim not found or already claimed!")
    ao.send({Target = M.From, Action = "Broadcast", Data = Colors.red .. "Claim not found or already claimed!" .. Colors.reset })
  end
end
)

Handlers.prepend("View-Quest", function (M)
  if M.Action == "Broadcasted" then
    local pattern = "/Quests:(%d+)"
    local number = string.match(M.Data, pattern)
    if number then
      return "continue"
    end
  end
  return false
end, function (M)
  local pattern = "/Quests:(%d+)"
  local number = string.match(M.Data, pattern)
  if number then
    generateList()
    local Data = string.format([[
      
Name: %s

Description
-----------
%s

]], listForUser[tonumber(number)].Name, listForUser[tonumber(number)].Description)
    ao.send({Target = M.From, Action = "Broadcast", Data = Data})
    print("sent quest details")
  end
end)


