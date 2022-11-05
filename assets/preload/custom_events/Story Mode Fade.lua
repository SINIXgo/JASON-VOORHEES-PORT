function onEvent(name, value1, value2)
	if name == "Story Mode Fade" and isStoryMode then
		doTweenAlpha('gameAlpha','camGame',value1,value2,'linear')
	end
end