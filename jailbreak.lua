local Folder = game:GetService("Workspace"):WaitForChild("Casino"):WaitForChild("RobberyDoor"):WaitForChild("Codes"):WaitForChild("Code")
function AddHighlight(Part)
    local Highlight = Instance.new("Highlight",game:GetService("CoreGui"))
    wait()
    Highlight.Adornee = v
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end    
for _,v in pairs(Folder:GetChildren())do
    AddHighlight(v)
end
Folder.ChildAdded:Connect(AddHighlight)
