local Games = {
	[142823291] = {
		Name = "mm2",
		Hidden = true,
	},
	[606849621] = {
		Name = "jailbreak",
		Hidden = false,
	},
	[8783157237] = {
		Name = "8783157237", -- game name is "有感筆電⚔️槍戰", which is problematic
		Hidden = false,
	},
	[6607474310] = {
		Name = "guestquestreforged",
		Hidden = true,
	},
	[164051105] = {
		Name = "superbombsurvival", -- Normal Servers
		Hidden = true,
	},
	[249163956] = {
		Name = "superbombsurvival", -- Super Intense Servers
		Hidden = true,
	},
}

local GameData = Games[game.PlaceId]
if GameData then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/GameScripts/main/" .. GameData.Name .. ".lua"))()
	end)
	return GameData.Hidden
end

return nil
