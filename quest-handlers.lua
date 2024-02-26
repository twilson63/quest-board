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
    AddClaim(M.Quest, M.From)
    print('Claim Added')
  end
)

Handlers.prepend("Claim-Quest-via-chat", function (M) 
  if M.Action == "Broadcasted" then
    local pattern = "^/Quest:Claim:(%w+)"
    local match = string.match(M.Data, pattern)
    if match then
      return "continue"
    end
  end
  return false
end, function (M) 
  local Quest = string.match(M.Data, "^/Quest:Claim:(%w+)")
  AddClaim(Quest, M.Broadcaster, M.Nickname)
  print('Claim Added')
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


