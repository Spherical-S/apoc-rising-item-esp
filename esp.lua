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

function getAmmo()
    local ammoList = {}
        for i,v in pairs(game.ReplicatedStorage.ItemData.Ammo:GetChildren()) do
            ammoList[v.Name] = i
        end
    return ammoList
end


uIS = game:GetService("UserInputService")
RunService = game:GetService("RunService")
uKey = Enum.KeyCode.U
iKey = Enum.KeyCode.I
oKey = Enum.KeyCode.O
player = game:GetService("Players").LocalPlayer
typing = false
wEspOn = true
aEspOn = true
vEspOn = true
weapons = getWeapons()
ammo = getAmmo()

clearESP()
-- for i,v in pairs(game.Workspace.Loot:GetDescendants()) do
--     if weapons[v.Name] or ammo[v.Name] then
--         print(v.Name)
--     end
-- end

uIS.TextBoxFocused:Connect(function()
    typing = true
end)

uIS.TextBoxFocusReleased:Connect(function()
    typing = false
end)

uIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == iKey and typing == false then
        wEspOn = not wEspOn
    end
    if Input.KeyCode == oKey and typing == false then
        aEspOn = not aEspOn
    end
    if Input.KeyCode == uKey and typing == false then
        vEspOn = not vEspOn
    end
end)

print('Done initializing')

local success, response = pcall(
    createESP()
)
print('ESP loaded!')
