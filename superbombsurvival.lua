local Players = game:GetService("Players")
local Folder = workspace:FindFirstChild("Bombs")
local ItemGroups = {
    ["CandyCorn"] = {"CandyCorn"},
    ["Traps"] = {"Duck","NitroBombBig","FakeCoin","FootBomb"},
    ["Meteors"] = {"ShockMeteor","IceMeteor","Comet","PoisonMeteor","SmallMeteor"},
    ["HomingMissiles"] = {"Wingseeker","HomingRocketBig","HomingRocketFast","ChaserRocketShock","ChaserRocketBig","HomingRocket","ChaserRocketIce"},
    ["Airstrikes"] = {"AirStrikeBig","ClusterMissileBig"},
    ["Nukes"] = {"Nuke","VeryBigNuke","PoisonNuke"},
    ["HalloweenCandy"] = {"HalloweenCandy"}
    ["EventIcon"] = {"EventIcon"},
    --["Ignore"] = {"SuperSoda","ChargeSoda","Gem","PizzaBox","Pizza","Coin_event","Coin_red","Coin_gold2","Coin_gold","Coin_silver","Coin_copper"}
}

getgenv().Collectables = {}

local function ToggleItemGroup(Group,Bool)
    for _,v in pairs(ItemGroups[Group])do
        local Exists = table.find(getgenv().Collectables,v)
        if Exists and not Bool then
            table.remove(getgenv().Collectables,Exists)
        elseif not Exists and (Bool == true or Bool == nil)then
            table.insert(getgenv().Collectables,v)
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/uilib.lua"))()
local Window = Library:Window("SBS")
for k,group in pairs(ItemGroups)do
    Window:Toggle("Touch " .. k,false,function(Bool)
        ToggleItemGroup(k,Bool)
    end) 
end

task.spawn(function()
    while wait(2)do
        local Root = Players.LocalPlayer.Character and (Players.LocalPlayer.Character:FindFirstChild("UpperTorso") or Players.LocalPlayer.Character.PrimaryPart)
        if not Root then
            return
        end
        
        for _,v in pairs(Folder:GetChildren())do
            if table.find(getgenv().Collectables,v.Name)then
                firetouchinterest(Root,v,0)
            end
        end
    end
end)
