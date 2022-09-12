local Folder = game:GetService("Workspace"):WaitForChild("Casino"):WaitForChild("RobberyDoor"):WaitForChild("Codes")
function AddHighlight(Part)
    if Part:IsA("BasePart")then
        local Highlight = Instance.new("Highlight",game:GetService("CoreGui"))
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Adornee = Part
        Highlight.FillTransparency = 1
        Part.Color = Color3.new(1,1,1)
        Part.Transparency = 0
    end
end
for _,v in pairs(Folder:GetDescendants())do
    AddHighlight(v)
end
Folder.DescendantAdded:Connect(AddHighlight)

local Players = game:GetService("Players")
function SetC(C)
    C:GetPropertyChangedSignal("Parent"):Connect(function()
        if C.Parent == nil then
           C.Parent = workspace
        end
    end)
end
function Set(P)
    if P.Character and P.Character.Parent == nil then
        P.Character.Parent = workspace
    end
    P.CharacterAdded:Connect(SetC)
    P:GetPropertyChangedSignal("Character"):Connect(function(Char)
        if Char and Char.Parent == nil then
           Char.Parent = workspace 
        end
    end)
end
for _,v in pairs(Players:GetPlayers())do
   Set(v) 
end
Players.PlayerAdded:Connect(function(P)
    Set(P)
end)
