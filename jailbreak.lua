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
