function onEvent(name, value1, value2)
	if name == "Flash Fade" then
		if toboolean(value2) == true then
			setProperty('camGame.alpha',1)
			cameraFlash('game','ffffff',1,false)
			doTweenAlpha('gameFade','camGame', 0, value1, 'linear')
		else
			setProperty('camGame.alpha',1)
			doTweenAlpha('gameFade','camGame', 0, value1, 'linear')
		end
	end
end

function toboolean(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end