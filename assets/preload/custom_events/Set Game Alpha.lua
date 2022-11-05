function onEvent(name, value1, value2)
	if name == "Set Game Alpha" then
		doTweenAlpha('gameAlpha','camGame',value1,value2,'linear')
	end
end