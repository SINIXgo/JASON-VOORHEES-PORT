local time;

function onEvent(name, value1, value2)
	if name == "Cinemax With Arrows" then
		makeLuaSprite('topBarArrows','',0,-88)
		makeLuaSprite('bottomBarArrows','',0,screenHeight)
		makeGraphic('topBarArrows', screenWidth, 88, '000000')
		makeGraphic('bottomBarArrows', screenWidth, 88, '000000')
		setObjectCamera('topBarArrows','other')
		setObjectCamera('bottomBarArrows','other')
		addLuaSprite('topBarArrows')
		addLuaSprite('bottomBarArrows')

		doTweenY('topBarArrowTween','topBarArrows',0,0.5,'linear')
		doTweenY('bottomBarArrowTween','bottomBarArrows', screenHeight - 88,0.5,'linear')
		doTweenAlpha('healthBarArrowTween','healthBar',0,0.5,'linear')
		doTweenAlpha('healthBarBGArrowTween','healthBarBG',0,0.5,'linear')
		doTweenAlpha('iconP1ArrowTween','iconP1',0,0.5,'linear')
		doTweenAlpha('iconP2ArrowTween','iconP2',0,0.5,'linear')
		doTweenAlpha('scoreTxtArrowTween','scoreTxt',0,0.5,'linear')
		if downscroll then
			for i = 4,7 do
				noteTweenY('start'..i,i,570-50,0.5,'linear')
			end
		else
			for i = 4,7 do
				noteTweenY('start'..i,i,50+50,0.5,'linear')
			end
		end


		time = value1;
	end
end

function onTweenCompleted(tag)
	if tag == 'topBarArrowTween' then
		runTimer('duration', time)
	end
end

function onTimerCompleted(tag)
	if tag == 'duration' then
		doTweenY('topBarArrowTween','topBarArrows',-88,0.5,'linear')
		doTweenY('bottomBarArrowTween','bottomBarArrows', screenHeight,0.5,'linear')
		doTweenAlpha('healthBarArrowTween','healthBar',1,0.5,'linear')
		doTweenAlpha('healthBarBGArrowTween','healthBarBG',1,0.5,'linear')
		doTweenAlpha('iconP1ArrowTween','iconP1',1,0.5,'linear')
		doTweenAlpha('iconP2ArrowTween','iconP2',1,0.5,'linear')
		doTweenAlpha('scoreTxtArrowTween','scoreTxt',1,0.5,'linear')
		if downscroll then
			for i = 4,7 do
				noteTweenY('end'..i,i,570,0.5,'linear')
			end
		else
			for i = 4,7 do
				noteTweenY('end'..i,i,50,0.5,'linear')
			end
		end
	end
end