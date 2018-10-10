-- CONFIG --

-- The watermark text --
servername = "discord.gg/teCy7Pe"

-- The x and y offset (starting at the top left corner) --
-- Default: 0.005, 0.001
offset = {x = 0.005, y = 0.023}

-- Text RGB Color --
-- Default: 64, 64, 64 (gray)
rgb = {r = 16, g = 16, b = 16}

-- Text transparency --
-- Default: 255
alpha = 65

-- Text scale
-- Default: 0.4
-- NOTE: Number needs to be a float (so instead of 1 do 1.0)
scale = 0.4

-- Text Font --
-- 0 - 5 possible
-- Default: 1
font = 4

-- Rainbow Text --
-- false: Turn off
-- true: Activate rainbow text (overrides color)
bringontherainbows = false

AddEventHandler("showHud", function (show)
	if show then
		alpha = 65
	else
		alpha = 0
	end
end)

-- CODE --
Citizen.CreateThread(function()
	while true do
		Wait(1)

		if bringontherainbows then
			rgb = RGBRainbow(0.01)
		end
		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(offset.x, offset.y)
	end
end)

-- By ash
function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end