function clearESP()
    for i,v in pairs(game.Workspace.Map.Shared.LootBins:GetDescendants()) do
        if v.Name == 'BillboardGui' then
            v:Destroy()
        end
    end
end


function getWeapons()
  local weaponList = {}
    for i,v in pairs(game.ReplicatedStorage.ItemData.Firearms:GetChildren()) do
        weaponList[v.Name] = i
    end
    return weaponList
end


uIS = game:GetService("UserInputService")
RunService = game:GetService("RunService")
lKey = Enum.KeyCode.L
player = game:GetService("Players").LocalPlayer
typing = false
espOn = true
weapons = getWeapons()

clearESP()
for i,v in pairs(game.Workspace.Loot:GetDescendants()) do
    if weapons[v.Name] then
        print(v.Name)
    end
end
