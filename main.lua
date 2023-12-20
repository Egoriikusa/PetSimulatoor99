loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib"))()
MakeWindow({
  Hub = {
    Title = "remo HUB",
    Animation = "by: remo9999"
  },
  Key = {
    KeySystem = false,
    Title = "Key System",
    Description = "",
    KeyLink = "https://xvideos.com",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})
-- tab
local Hentai = MakeTab({Name = "Main"})

local section = AddSection(Hentai, {"Pet Simulator 99"})
--Auto Farm Coins
local AutofarmToggle = AddToggle(Hentai, {
  Name = "Auto Farm Coins",
  Default = false,
  Callback = function(Value)
while getgenv().AutoFarmCoins do task.wait() 
local Coin = GetCoins()[math.random(1, #GetCoins())]

if Coin then

Network.Breakables_PlayerDealDamage:FireServer(Coin.Name)
  end
 end
end

})
--auto collect Lootbags
local LootbagsToggle = AddToggle(Hentai, {
  Name = "Auto Collect Lootbags",
  Default = false,
  Callback = function(Value)
    getgenv().AutoLootbags = Value
    while getgenv().AutoLootbags do task.wait()
      for _,v in pairs(workspace["__THINGS"].Lootbags:GetChildren()) do
        pcall(function()
          v.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end)
      end
    end
  end
})
--auto collect orbs
local OrbsToggle = AddToggle(Hentai, {
  Name = "Auto Collect Orbs",
  Default = false,
  Callback = function(Value)
    getgenv().AutoOrbs = Value
    while getgenv().AutoOrbs do task.wait()
      for _,v in pairs(workspace["__THINGS"].Orbs:GetChildren()) do
        pcall(function()
          v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end)
      end
    end
  end

})
