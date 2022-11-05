function onEvent(name, value1, value2)
	if name == "Set HUD Alpha" then
		setProperty('camHUD.alpha',tonumber(value1))
	end
end