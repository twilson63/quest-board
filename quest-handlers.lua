Handlers.prepend("List-Quests", function (Msg)
  return Msg.Action == "Broadcasted" and Msg.Data == "/Quests" and "continue"
end, function (Msg)
  generateList()
  ao.send({Target = Msg.From, Action = "Broadcast", Data = Colors.green .. "\n\nQuests \n\n" .. Colors.reset .. printlist(listForUser) })
end)

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


