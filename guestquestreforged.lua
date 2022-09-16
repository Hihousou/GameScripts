local AutoAttack = false
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


local Connection = nil
function SetupTool(Tool)
	Connection = Tool.DescendantAdded:Connect(function(Child)
		if Child:IsA("TouchTransmitter")then
			for _,v in pairs(workspace.Mobs.Alive:GetChildren())do
				if v and v.PrimaryPart then
					firetouchinterest(Child.Parent,v.PrimaryPart,0)
				end
			end
			
			Connection:Disconnect()
		end
	end)
	
	
end
function HitAll()
	if lPlayer.Character then
		local Tool = lPlayer.Character:FindFirstChildOfClass("Tool")
		if Tool then
			SetupTool(Tool)
			Tool.RemoteEvent:FireServer(lPlayer.Character,lPlayer.Character.Humanoid,lPlayer.Character.Torso)
		end
	end
end
HitAll()


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/uilib.lua"))()
local Window = Library:Window("GQ: Reforged")
Window:Toggle("Spam Shoot (Bow)",false,function(Bool)
	AutoAttack = Bool
end)
Window:Button("Hit All (Sword)",false,HitAll)

task.spawn(function()
	while wait()do -- because throttling is awesome
		if AutoAttack then
          get()
        end
	end
end)
