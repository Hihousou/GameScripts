local Library = _G.Library or loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/uilib.lua"))()_G.Library=Library
local Esp = _G.Esp or loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/esp.lua"))()_G.Esp=Esp

function HasItem(Player,Name)
    if Player.Backpack:FindFirstChild(Name) or Player.Character and Player.Character:FindFirstChild(Name)then
        return true
    end
end
function GetRoles()
	if not Esp.Active then return end
	local OldSettings = Esp.Settings
	local NewSettings = {}
	for i,v in pairs(Settings)do
		if i ~= "ShowTeam" then
			NewSettings[i] = false
		end
	end
	
    local M,S = nil,nil
    for _,v in pairs(game:GetService("Players"):GetPlayers())do
        if not M and HasItem(v,"Knife")then
            M = v
        end
        if not S and HasItem(v,"Gun")then
            S = v
        end
    end
    
    local NewSettings = {}
    if M then NewSettings[M.Name] = Color3.fromRGB(255,0,0)end
    if S then NewSettings[S.Name] = Color3.fromRGB(0,0,255)end
	if Esp.Active then Esp:Update(NewSettings)end
end

local Window = Library:Window("MM2")
Window:Toggle("Esp (MM2)",true,function(Bool)
	if Bool and not Esp.Active then
		Esp:Auto()
	else
		Esp:Clear()
	end
end)

while wait(5)do
	GetRoles()
end
