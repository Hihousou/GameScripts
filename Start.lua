local Games = {
	[142823291] = "mm2",
    [8783157237] = "8783157237", -- game name is "有感筆電⚔️槍戰", which is problematic
}

local GameName = Games[game.PlaceId]
if GameName then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/GameScripts/main/" .. GameName .. ".lua"))()
end
