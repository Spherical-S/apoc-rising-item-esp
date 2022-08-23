function clearESP()
    for i,v in pairs(game.Workspace.Map.Shared.LootBins:GetDescendants()) do
        if v.Name == 'BillboardGui' then
            v:Destroy()
        end
    end
    for i,v in pairs(game.Workspace.Vehicles.Spawned:GetDescendants()) do
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


function createWESP()
    local opacity = 0
    local size = 0
    if wEspOn then
        opacity = 0.6
        size = 0.5
    end
    if not wEspOn then
        opacity = 1
        size = 0
    end
    for i,v in pairs(game.Workspace.Loot:GetDescendants()) do
        if weapons[v.Name] then
            local weaponName = v.Name
            local boxName = v.Parent.Name
            local boxs = game.Workspace.Map.Shared.LootBins
            local box = boxs:FindFirstChild(boxName)
            if box then
                local group = box:FindFirstChild("Group")
                local part = group:FindFirstChild("Part")
                local dist = math.ceil((player:DistanceFromCharacter(part.Position)))
                local gui = Instance.new('BillboardGui')
                local TextLabel = Instance.new('TextLabel')

                gui.Parent = part
                gui.AlwaysOnTop = true
                gui.Size = UDim2.new(0,200,0,50)
                gui.StudsOffset = Vector3.new(0,2,0)
                TextLabel.Parent = gui
                TextLabel.BackgroundColor3 = Color3.new(1,1,1)
                TextLabel.BackgroundTransparency = opacity
                TextLabel.Size = UDim2.new(size, 0, size, 0)
                TextLabel.Text = weaponName .. " ("..dist..")"
                TextLabel.TextColor3 = Color3.new(0, 0, 0)
                TextLabel.TextScaled = true
            end
        end
    end
end


function createAESP()
    local opacity = 0
    local size = 0
    if aEspOn then
        opacity = 0.6
        size = 0.5
    end
    if not aEspOn then
        opacity = 1
        size = 0
    end
    for i,v in pairs(game.Workspace.Loot:GetDescendants()) do
        if ammo[v.Name] then
            local ammoName = v.Name
            local boxName = v.Parent.Name
            local boxs = game.Workspace.Map.Shared.LootBins
            local box = boxs:FindFirstChild(boxName)
            if box then
                local group = box:FindFirstChild("Group")
                local part = group:FindFirstChild("Part")
                local dist = math.ceil((player:DistanceFromCharacter(part.Position)))
                local gui = Instance.new('BillboardGui')
                local TextLabel = Instance.new('TextLabel')

                gui.Parent = part
                gui.AlwaysOnTop = true
                gui.Size = UDim2.new(0,200,0,50)
                gui.StudsOffset = Vector3.new(0,2,0)
                TextLabel.Parent = gui
                TextLabel.BackgroundColor3 = Color3.new(1,1,1)
                TextLabel.BackgroundTransparency = opacity
                TextLabel.Size = UDim2.new(size, 0, size, 0)
                TextLabel.Text = ammoName .. " ("..dist..")"
                TextLabel.TextColor3 = Color3.new(0, 0, 0)
                TextLabel.TextScaled = true
            end
        end
    end
end


function createVESP()
    local opacity = 0
    local size = 0
    if vEspOn then
        opacity = 0.6
        size = 0.5
    end
    if not vEspOn then
        opacity = 1
        size = 0
    end
    for i,v in pairs(game.Workspace.Vehicles.Spawned:GetChildren()) do
        local carName = v.Name
        local dist = math.ceil((player:DistanceFromCharacter(v.Base.Position)))
        local gui = Instance.new('BillboardGui')
        local TextLabel = Instance.new('TextLabel')

        gui.Parent = v.Base
        gui.AlwaysOnTop = true
        gui.Size = UDim2.new(0,200,0,50)
        gui.StudsOffset = Vector3.new(0,2,0)
        TextLabel.Parent = gui
        TextLabel.BackgroundColor3 = Color3.new(1,1,1)
        TextLabel.BackgroundTransparency = opacity
        TextLabel.Size = UDim2.new(size, 0, size, 0)
        TextLabel.Text = carName .. " ("..dist..")"
        TextLabel.TextColor3 = Color3.new(0, 0, 0)
        TextLabel.TextScaled = true
    end
end


uIS = game:GetService("UserInputService")
RunService = game:GetService("RunService")
uKey = Enum.KeyCode.U
iKey = Enum.KeyCode.I
oKey = Enum.KeyCode.O
jKey = Enum.KeyCode.J
kKey = Enum.KeyCode.K
lKey = Enum.KeyCode.L
player = game:GetService("Players").LocalPlayer
typing = false
wEspOn = true
aEspOn = true
vEspOn = true
weapons = getWeapons()
ammo = getAmmo()

clearESP()

uIS.TextBoxFocused:Connect(function()
    typing = true
end)

uIS.TextBoxFocusReleased:Connect(function()
    typing = false
end)

uIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == uKey and typing == false then
        wEspOn = not wEspOn
        print('Pressed u (turn off weapon ESP)')
    end
    if Input.KeyCode == iKey and typing == false then
        aEspOn = not aEspOn
        print('Pressed i (turn off ammo ESP)')
    end
    if Input.KeyCode == oKey and typing == false then
        vEspOn = not vEspOn
        print('Pressed o (turn off vehicle ESP)')
    end
    if Input.KeyCode == lKey and typing == false then
        clearESP()
        print('Pressed l (refresh ESP)')
        createVESP()
        createWESP()
        createAESP()
    end
end)

print('Done initializing')


createAESP()
createWESP()
createVESP()
