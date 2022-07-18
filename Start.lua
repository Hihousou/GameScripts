local Games = {
	[142823291] = {
		Name = "mm2",
		Hidden = true,
	},
	[8783157237] = {
		Name = "8783157237", -- game name is "有感筆電⚔️槍戰", which is problematic
		Hidden = false,
	},
}

local GameData = Games[game.PlaceId]
if GameData then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/GameScripts/main/" .. GameData.Name .. ".lua"))()
	end)
end
return GameData.Hidden or false
