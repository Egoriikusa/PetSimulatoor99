local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "remo HUB",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

local HentaiTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998"  -- Replace with a suitable icon if desired
})

local PetSimSection = HentaiTab:AddSection({
    Name = "Pet Simulator 99"
})

local AutoFarmToggle = PetSimSection:AddToggle({
    Name = "Auto Farm Coins",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmCoins = Value
        while getgenv().AutoFarmCoins do
            task.wait()
            local Coin = GetCoins()[math.random(1, #GetCoins())]
            if Coin then
                Network.Breakables_PlayerDealDamage:FireServer(Coin.Name)
            end
        end
    end
})

-- ... other code ...

local SelectedMapName = ""  -- Store selected map name

local TeleportToggle = PetSimSection:AddToggle({
    Name = "Teleport to Selected Map",
    Default = false,
    Callback = function(Value)
        if Value and SelectedMapName ~= "" then
            local ZoneFolder = game:GetService("ReplicatedStorage").__DIRECTORY.Zones["Early Game"]
            local SelectedMap = ZoneFolder[SelectedMapName]  -- Use the correct path here
            if SelectedMap then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedMap.CFrame
            else
                warn("Selected map not found:", SelectedMapName)
            end
        end
    end
})
Tab:AddToggle({
	Name = "Distige Chest Esp",
	Default = false,
	Callback = function(Value)
		print(Value)
    

local chestsn = {
    "Animated",
    -- Add other chest names here
}

local function contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

while task.wait(0.1) do
    for __, v in pairs(game.Workspace["__THINGS"].__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetChildren()) do
        if v:FindFirstChild("ESP") then
            v.ESP:Destroy()
        end

        if contains(chestsn, v.Name) then
            local tcolor = Color3.fromRGB(222, 184, 135)
            if v.Name == "Animated" then
                tcolor = Color3.fromRGB(135, 206, 250)
            end

            local esp = Instance.new("BillboardGui", v)
            esp.Name = "ESP"
            esp.Size = UDim2.new(0, 75, 0, 75) -- Smaller ESP size
            esp.AlwaysOnTop = true
            esp.MaxDistance = 100

            local frame = Instance.new("Frame", esp)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0.3
            frame.BorderSizePixel = 2
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BackgroundColor3 = tcolor
            frame.ZIndex = 10

            local textLabel = Instance.new("TextLabel", frame)
            textLabel.Size = UDim2.new(1, 0, 0.2, 0) -- Adjusted text size
            textLabel.Position = UDim2.new(0, 0, 0.8, 0) -- Adjusted text position
            textLabel.Text = "Chest"
            textLabel.TextScaled = true
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = tcolor
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextStrokeTransparency = 0.5

            local detailLabel = Instance.new("TextLabel", frame)
            detailLabel.Size = UDim2.new(1, 0, 0.2, 0)
            detailLabel.Position = UDim2.new(0, 0, 0.6, 0) -- Adjusted detail text position
            detailLabel.Text = "Details here"
            detailLabel.TextScaled = true
            detailLabel.BackgroundTransparency = 1
            detailLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
            detailLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            detailLabel.TextStrokeTransparency = 0.5

            local outline = Instance.new("ImageLabel", esp)
            outline.Image = "rbxassetid://554054954"
            outline.Size = UDim2.new(1.2, 0, 1.2, 0)
            outline.Position = UDim2.new(-0.1, 0, -0.1, 0)
            outline.ZIndex = 5
            outline.ImageTransparency = 0.8
            outline.ImageColor3 = tcolor
            outline.ScaleType = Enum.ScaleType.Slice
            outline.SliceCenter = Rect.new(100, 100, 100, 100)
        end
    end
end
	end    
})
OrionLib:Init()
