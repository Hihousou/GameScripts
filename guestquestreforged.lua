_G.Active = true

local lPlayer = game.Players.LocalPlayer
function get()
    if lPlayer.Character then
        local Humanoid = lPlayer.Character:FindFirstChild("Humanoid")
        local Torso = lPlayer.Character:FindFirstChild("Torso")
        local Tool = lPlayer.Character:FindFirstChildOfClass("Tool")
        if Humanoid and Torso and Tool then
           Tool.RemoteEvent:FireServer(lPlayer.Character,Humanoid,Torso) 
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/uilib.lua"))()
local Window = Library:Window("Guest Quest Reforged")
Window:Toggle("Auto Attack (Bow)",false,function(Bool)
	_G.Active = Bool
end)

task.spawn(function()
	while wait()do -- because throttling is awesome
		if _G.Active then
          get()
        end
	end
end)
