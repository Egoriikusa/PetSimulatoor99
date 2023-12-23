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

local TeleportDropdown = PetSimSection:AddDropdown({
    Name = "Teleport to Map",
    Default = "1 | Spawn",
    Options = {
        "1 | Spawn",
        "2 | Colorful Forest",
        "3 | Castle",
        "4 | Green Forest",
        "5 | Autumn",
        "6 | Cherry Blossom",
        "7 | Farm",
        "8 | Backyard",
        "9 | Misty Falls",
        "10 | Mine",
        "11 | Crystal Caverns",
        "12 | Dead Forest",
        "13 | Dark Forest",
        "14 | Mushroom Field",
        "15 | Enchanted Forest",
        "16 | Crimson Forest",
        "17 | Jungle",
        "18 | Jungle Temple",
        "19 | Oasis",
        "20 | Beach",
        "21 | Coral Reef",
        "22 | Shipwreck",
        "23 | Atlantis",
        "24 | Palm Beach",
        "25 | Tiki",
        "26 | Pirate Cove",
        "27 | Pirate Tavern",
        "28 | Shanty Town",
        "29 | Desert Village",
        "30 | Fossil Digsite",
        "31 | Desert Pyramids",
        "32 | Red Desert",
        "33 | Wild West",
        "34 | Grand Canyons",
        "35 | Safari",
        "36 | Mountains",
        "37 | Snow Village",
        "38 | Icy Peaks",
        "39 | Ice Rink",
        "40 | Ski Town",
        "41 | Hot Springs",
        "42 | Fire and Ice",
        "43 | Volcano",
        "44 | Obsidian Cave",
        "45 | Lava Forest",
        "46 | Underworld",
        "47 | Underworld Bridge",
        "48 | Underworld Castle",
        "49 | Metal Dojo",
        "50 | Fire Dojo"
    },
    Callback = function(Value)
        SelectedMapName = Value:split(" | ")[1]
    end
})

-- ... other code ...

OrionLib:Init()
