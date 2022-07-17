local Games = {
	[142823291] = "mm2",
    [8783157237] = "有感筆電⚔️槍戰",
}

local GameName = Games[game.PlaceId]
if GameName then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/GameScripts/main/" .. GameName .. ".lua"))()
end
