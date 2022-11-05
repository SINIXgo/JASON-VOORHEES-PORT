lights = true
camZoomSet = false
hideHud = false
setDownscroll = false
songEnded = false

highestCombo = 0
comboStop = false

finishHim = false

function onCreate()
	-- background shit
	makeLuaSprite('funny', 'pixel/jasonpixelbg', 0, 0);
	-- makeAnimatedLuaSprite('funny', 'pixel/BackgroundJasonPixel', 0, -100);
	-- addAnimationByPrefix('funny','lightson','BackgroundJasonPixel LightOn')
	-- addAnimationByPrefix('funny','lightsoff','BackgroundJasonPixel LightOff')
	-- objectPlayAnimation('funny', 'lightson')
	addLuaSprite('funny', false);

	makeLuaSprite('lightsout', 'pixel/jasonpixelbgoff', 0, 0);
	-- makeAnimatedLuaSprite('funny', 'pixel/BackgroundJasonPixel', 0, -100);
	-- addAnimationByPrefix('funny','lightson','BackgroundJasonPixel LightOn')
	-- addAnimationByPrefix('funny','lightsoff','BackgroundJasonPixel LightOff')
	-- objectPlayAnimation('funny', 'lightson')
	addLuaSprite('lightsout', false);
	setProperty('lightsout.alpha',0);

	makeLuaSprite('top','',getProperty('funny.x'),getProperty('funny.y'))
	makeGraphic('top',getProperty('funny.width'),600,'000000')

	makeLuaSprite('bottom','',getProperty('funny.x'),getProperty('funny.y'))
	makeGraphic('bottom',getProperty('funny.width'),600,'000000')
	setProperty('bottom.y', getProperty('funny.height') - getProperty('bottom.height'))

	addLuaSprite('top',true)
	addLuaSprite('bottom',true)

	-- for i = 0, getProperty('unspawnNotes.length')-1 do
	-- 	-- doTweenX(i..'x','unspawnNotes['..i..'].scale', 1, 0.1, 'linear')
	-- 	-- doTweenY(i..'y','unspawnNotes['..i..'].scale', 1, 0.1, 'linear')
	-- 	setPropertyFromGroup('unspawnNotes', i, 'scale.x', 1)
	-- 	setPropertyFromGroup('unspawnNotes', i, 'scale.y', 1)
	-- end
	makeLuaSprite('childrenDot','pixel/dot', 240, 50)
	setObjectCamera('childrenDot','hud')
	addLuaSprite('childrenDot')

	makeLuaSprite('boxOne','pixel/itemBox', screenWidth - 315, screenHeight - 100)
	setObjectCamera('boxOne', 'hud')
	setGraphicSize('boxOne',75,75)
	addLuaSprite('boxOne')

	makeLuaSprite('boxTwo','pixel/itemBox', screenWidth - 415, screenHeight - 100)
	setObjectCamera('boxTwo', 'hud')
	setGraphicSize('boxTwo',75,75)
	addLuaSprite('boxTwo')

	makeLuaSprite('boxThree','pixel/itemBox', screenWidth - 315, screenHeight - 200)
	setObjectCamera('boxThree', 'hud')
	setGraphicSize('boxThree',75,75)
	addLuaSprite('boxThree')

	makeLuaSprite('boxFour','pixel/itemBox', screenWidth - 415, screenHeight - 200)
	setObjectCamera('boxFour', 'hud')
	setGraphicSize('boxFour',75,75)
	addLuaSprite('boxFour')	

	makeLuaSprite('songInfo','pixel/options', screenWidth - 460, 140)
	setObjectCamera('songInfo', 'hud')
	addLuaSprite('songInfo')	

	makeLuaSprite('boxP1','pixel/itemBox', screenWidth - 315, 25)
	setObjectCamera('boxP1', 'hud')
	setGraphicSize('boxP1',90,90)
	addLuaSprite('boxP1')

	makeLuaSprite('boxP2','pixel/itemBox', screenWidth - 415, 25)
	setObjectCamera('boxP2', 'hud')
	setGraphicSize('boxP2',90,90)
	addLuaSprite('boxP2')	

	makeLuaSprite('mainBox','pixel/itemBox', screenWidth - 500, screenHeight - 500)
	setObjectCamera('mainBox', 'hud')
	setGraphicSize('mainBox',200,300)
	-- addLuaSprite('mainBox')	
	-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage

	makeLuaText('change','Change', '', screenWidth - 420, getProperty('songInfo.y') + 50)
	setObjectCamera('change', 'hud')
	setTextFont('change', 'arcaden.ttf')
	setTextSize('change',30)
	addLuaText('change')

	makeLuaText('pass','Pass', '', screenWidth - 420, getProperty('songInfo.y') + 125)
	setObjectCamera('pass', 'hud')
	setTextFont('pass', 'arcaden.ttf')
	setTextSize('pass',30)
	addLuaText('pass')

	makeLuaText('cure','Cure', '', screenWidth - 420, getProperty('songInfo.y') + 200)
	setObjectCamera('cure', 'hud')
	setTextFont('cure', 'arcaden.ttf')
	setTextSize('cure',30)
	addLuaText('cure')

	makeLuaText('take','Take', '', screenWidth - 420, getProperty('songInfo.y') + 275)
	setObjectCamera('take', 'hud')
	setTextFont('take', 'arcaden.ttf')
	setTextSize('take',30)
	addLuaText('take')

	makeLuaText('bfName', boyfriendName, '', 250, 550)
	if boyfriendName == 'bf-pixel-back' then setTextString('bfName', 'boyfriend') end
	setTextFont('bfName', 'arcaden.ttf')
	setObjectCamera('bfName','hud')
	setTextSize('bfName',25)
	addLuaText('bfName')

	makeLuaText('dadName', dadName, '', 250, 625)
	if dadName == 'pixeljason' then setTextString('dadName', 'jason') end
	setTextFont('dadName', 'arcaden.ttf')
	setObjectCamera('dadName','hud')
	setTextSize('dadName',25)
	addLuaText('dadName')

	makeLuaSprite('topPlayerBar','',getProperty('bfName.x'),getProperty('bfName.y') + getProperty('bfName.height'))
	makeGraphic('topPlayerBar', 224, 3, '782d3d')
	setObjectCamera('topPlayerBar','hud')
	addLuaSprite('topPlayerBar')

	makeLuaSprite('topOpponentBar','',getProperty('dadName.x'),getProperty('dadName.y') + getProperty('dadName.height'))
	makeGraphic('topOpponentBar', 224, 3, '782d3d')
	setObjectCamera('topOpponentBar','hud')
	addLuaSprite('topOpponentBar')

	for i = 0, 31 do
		if i == 0 then
			makeLuaSprite('p'..i, 'pixel/health', getProperty('topPlayerBar.x'), getProperty('topPlayerBar.y') + getProperty('topPlayerBar.height'))
			setObjectCamera('p'..i,'hud')
			addLuaSprite('p'..i)
			makeLuaSprite('o'..i, 'pixel/health', getProperty('topOpponentBar.x'), getProperty('topOpponentBar.y') + getProperty('topOpponentBar.height'))
			setObjectCamera('o'..i,'hud')
			addLuaSprite('o'..i)
		else
			j = i - 1
			makeLuaSprite('p'..i, 'pixel/health', getProperty('p'..j..'.x') + getProperty('p'..j..'.width'), getProperty('topPlayerBar.y') + getProperty('topPlayerBar.height'))
			setObjectCamera('p'..i,'hud')
			addLuaSprite('p'..i)
			makeLuaSprite('o'..i, 'pixel/health', getProperty('o'..j..'.x') + getProperty('p'..j..'.width'), getProperty('topOpponentBar.y') + getProperty('topOpponentBar.height'))
			setObjectCamera('o'..i,'hud')
			addLuaSprite('o'..i)
		end
	end

	makeLuaSprite('bottomPlayerBar','',getProperty('bfName.x'),getProperty('p0.y') + getProperty('p0.height'))
	makeGraphic('bottomPlayerBar', 224, 3, '782d3d')
	setObjectCamera('bottomPlayerBar','hud')
	addLuaSprite('bottomPlayerBar')

	makeLuaSprite('bottomOpponentBar','',getProperty('dadName.x'),getProperty('o0.y') + getProperty('o0.height'))
	makeGraphic('bottomOpponentBar', 224, 3, '782d3d')
	setObjectCamera('bottomOpponentBar','hud')
	addLuaSprite('bottomOpponentBar')

	makeLuaSprite('scoreDot','pixel/dot',500, 560)
	setObjectCamera('scoreDot','hud')
	addLuaSprite('scoreDot')

	makeLuaText('scoreArcade', '000000', '', 530, 560)
	setTextFont('scoreArcade', 'arcaden.ttf')
	setObjectCamera('scoreArcade','hud')
	setTextSize('scoreArcade',25)
	addLuaText('scoreArcade')

	makeLuaText('ratingArcade', '', '', 750, 560)
	setTextFont('ratingArcade', 'arcaden.ttf')
	setObjectCamera('ratingArcade','hud')
	setTextSize('ratingArcade',25)
	-- setTextBorder('ratingArcade',0,'FFFFFF')
	addLuaText('ratingArcade')
	setProperty('ratingArcade.alpha',0)

	makeLuaSprite('missDot','pixel/dot',500, getProperty('scoreArcade.y') + 35)
	setObjectCamera('missDot','hud')
	addLuaSprite('missDot')

	makeLuaText('missArcade', '000000', '', 530, getProperty('scoreArcade.y') + 35)
	setTextFont('missArcade', 'arcaden.ttf')
	setObjectCamera('missArcade','hud')
	setTextSize('missArcade',25)
	addLuaText('missArcade')

	makeLuaSprite('rateDot','pixel/dot',500, getProperty('missArcade.y') + 35)
	setObjectCamera('rateDot','hud')
	addLuaSprite('rateDot')

	makeLuaText('rateArcade', '000000', '', 530, getProperty('missArcade.y') + 35)
	setTextFont('rateArcade', 'arcaden.ttf')
	setObjectCamera('rateArcade','hud')
	setTextSize('rateArcade',25)
	addLuaText('rateArcade')
	

	makeLuaSprite('comboDot','pixel/dot',500, getProperty('rateArcade.y') + 35)
	setObjectCamera('comboDot','hud')
	addLuaSprite('comboDot')

	makeLuaText('comboArcade', 'C:'..string.format("%06d", getProperty('combo')), '', 530, getProperty('rateArcade.y') + 35)
	setTextFont('comboArcade', 'arcaden.ttf')
	setObjectCamera('comboArcade','hud')
	setTextSize('comboArcade',25)
	addLuaText('comboArcade')

	makeLuaText('timeArcade', '000', '', 240, 110)
	setTextFont('timeArcade', 'arcaden.ttf')
	setObjectCamera('timeArcade','hud')
	setTextSize('timeArcade',25)
	addLuaText('timeArcade')

	camZoomSet = getPropertyFromClass('ClientPrefs','camZooms')
    setPropertyFromClass('ClientPrefs','camZooms',false)

    hideHud = getPropertyFromClass('ClientPrefs','hideHud')
	
	setDownscroll = getPropertyFromClass('ClientPrefs','downScroll')
    setPropertyFromClass('ClientPrefs', 'downScroll', false)
	setProperty('showRating',false)
	setProperty('showComboNum',false)

	setPropertyFromClass('GameOverSubstate','characterName','bf-pixel-back-death');
	setPropertyFromClass('GameOver8BitSubstate','characterName','bf-pixel-back-death');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/8bitdeath');
	setPropertyFromClass('GameOver8BitSubstate', 'deathSoundName', 'death/8bitdeath');

	    if getPropertyFromClass('PlayState','deathCounter') == 0 then
			setPropertyFromClass('GameOverSubstate','loopSoundName','gameOver-Pixel');
			setPropertyFromClass('GameOver8BitSubstate','loopSoundName','gameOver-Pixel');
			setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-Pixel'); --put in mods/music/
			setPropertyFromClass('GameOver8BitSubstate', 'endSoundName', 'gameOverEnd-Pixel'); --put in mods/music/
    	else
			setPropertyFromClass('GameOverSubstate','loopSoundName','GameOver_AltPixel');
			setPropertyFromClass('GameOver8BitSubstate','loopSoundName','GameOver_AltPixel');
			setPropertyFromClass('GameOverSubstate', 'endSoundName', 'GameOverEnd_AltPixel'); --put in mods/music/
			setPropertyFromClass('GameOver8BitSubstate', 'endSoundName', 'GameOverEnd_AltPixel'); --put in mods/music/
    end
end

-- This will feature an end cutscene
-- function onEndSong()

-- end

function onDestroy()
    setPropertyFromClass('ClientPrefs','camZooms',camZoomSet)
    setPropertyFromClass('ClientPrefs', 'downScroll', setDownscroll)
end

function onCreatePost()
	-- setProperty('gf.visible', false)
    -- setTextFont('scoreTxt','arcaden.ttf')
    -- setTextFont('timeTxt','arcaden.ttf')
    -- setTextFont('botplayTxt','arcaden.ttf')
	-- setPropertyFromClass('Application.current.window','width',960)
	-- setPropertyFromClass('Application','current.window.width',960)
end

function onStartCountdown()
    -- setPropertyFromClass('Application','current.window.width',640)
    -- setPropertyFromClass('Application','current.window.height',360)
    -- setPropertyFromClass('Application','current.window.fullscreen',true)
    triggerEvent("Camera Follow Pos", 1750, 1550)
    return Function_Continue;
end

function onCreatePost()
	removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
	-- setProperty('Application.current.windows.width',1280)
	-- setProperty('iconP1.alpha',0)
    setProperty('iconP2.alpha',0)
    setProperty('healthBarBG.alpha',0)
    setProperty('healthBar.alpha',0)
    setProperty('scoreTxt.alpha',0)
	setProperty('timeTxt.visible',false)
	setProperty('timeBar.visible',false)
	setProperty('timeBarBG.visible',false)

	setProperty('iconP1.x', getProperty('boxP2.x'))
	setProperty('iconP1.y', getProperty('boxP2.y'))

	makeLuaSprite('mic','pixel/microphone', getProperty('boxP1.x'), getProperty('boxP1.y'))
	setObjectCamera('mic', 'hud')
	addLuaSprite('mic')
end

function onUpdate(elapsed)
	-- if not middlescroll then
	-- 	noteTweenX('noteTweenX4', 4, 412, 0.1, 'linear')
    -- 	noteTweenX('noteTweenX5', 5, 524, 0.1, 'linear')
    -- 	noteTweenX('noteTweenX6', 6, 636, 0.1, 'linear')
    -- 	noteTweenX('noteTweenX7', 7, 748, 0.1, 'linear')
	-- end

		noteTweenX('noteTweenX4', 4, 347, 0.1, 'linear')
    	noteTweenX('noteTweenX5', 5, 437, 0.1, 'linear')
    	noteTweenX('noteTweenX6', 6, 527, 0.1, 'linear')
    	noteTweenX('noteTweenX7', 7, 617, 0.1, 'linear')

	noteTweenX('noteTweenX0', 0, getProperty('boxFour.x') - 12.5, 0.1, 'linear')
	noteTweenX('noteTweenX1', 1, getProperty('boxThree.x') - 12.5, 0.1, 'linear')
	noteTweenX('noteTweenX2', 2, getProperty('boxTwo.x') - 12.5, 0.1, 'linear')
    noteTweenX('noteTweenX3', 3, getProperty('boxOne.x') - 12.5, 0.1, 'linear')

	noteTweenY('noteTweenY0', 0, getProperty('boxFour.y') - 12.5, 0.1, 'linear')
	noteTweenY('noteTweenY1', 1, getProperty('boxThree.y') - 12.5, 0.1, 'linear')
	noteTweenY('noteTweenY2', 2, getProperty('boxTwo.y') - 12.5, 0.1, 'linear')
    noteTweenY('noteTweenY3', 3, getProperty('boxOne.y') - 12.5, 0.1, 'linear')

	doTweenX('opponentScaleLeftX','strumLineNotes.members[0].scale', 3.5, 0.1,'linear')
	doTweenY('opponentScaleLeftY','strumLineNotes.members[0].scale', 3.5, 0.1,'linear')

	doTweenX('opponentScaleDownX','strumLineNotes.members[1].scale', 3.5, 0.1,'linear')
	doTweenY('opponentScaleDownY','strumLineNotes.members[1].scale', 3.5, 0.1,'linear')

	doTweenX('opponentScaleUpX','strumLineNotes.members[2].scale', 3.5, 0.1,'linear')
	doTweenY('opponentScaleUpY','strumLineNotes.members[2].scale', 3.5, 0.1,'linear')

	doTweenX('opponentScaleRightX','strumLineNotes.members[3].scale', 3.5, 0.1,'linear')
	doTweenY('opponentScaleRightY','strumLineNotes.members[3].scale', 3.5, 0.1,'linear')

	doTweenX('playerScaleLeftX','strumLineNotes.members[4].scale', 4, 0.1,'linear')
	doTweenY('playerScaleLeftY','strumLineNotes.members[4].scale', 4, 0.1,'linear')

	doTweenX('playerScaleDownX','strumLineNotes.members[5].scale', 4, 0.1,'linear')
	doTweenY('playerScaleDownY','strumLineNotes.members[5].scale', 4, 0.1,'linear')

	doTweenX('playerScaleUpX','strumLineNotes.members[6].scale', 4, 0.1,'linear')
	doTweenY('playerScaleUpY','strumLineNotes.members[6].scale', 4, 0.1,'linear')

	doTweenX('playerScaleRightX','strumLineNotes.members[7].scale', 4, 0.1,'linear')
	doTweenY('playerScaleRightY','strumLineNotes.members[7].scale', 4, 0.1,'linear')

	setTextFont('scoreTxt','arcaden.ttf')
    setTextFont('timeTxt','arcaden.ttf')
    setTextFont('botplayTxt','arcaden.ttf')

	setProperty('scoreTxt.visible', false)

	-- comboNum = string.format("%06d", getProperty('combo'))
	
	if getProperty('combo') >= highestCombo then
		comboStop = false
	end

	if lights then
		setProperty('lightsout.alpha',0);
		setProperty('funny.alpha',1);
	elseif not lights then
		setProperty('lightsout.alpha',1);
		setProperty('funny.alpha',0);
	end

	setTextString('scoreArcade', 'S:'..string.format("%06d", getScore()))
	setTextString('missArcade', 'M:'..string.format("%06d", getMisses()))
	setTextString('rateArcade', 'R:'..getProperty('ratingName'))

	if not finishHim then
		healthUpdate()
	end
	

	-- setTextString('timeArcade', getPropertyFromClass('Conductor','songPosition'))
	-- setTextString('timeArcade', getProperty('songLength'))
	curTime = getPropertyFromClass('Conductor','songPosition') - getPropertyFromClass('ClientPrefs','noteOffset')
	calcTime = songLength - curTime;
	if getPropertyFromClass('ClientPrefs','timeBarType') == 'Time Elapsed' then
		calcTime = curTime;
	end

	if curTime == songLength then
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
	end

	seconds = math.floor(calcTime / 1000);
	setTextString('timeArcade', string.format("%03d", seconds))

	-- for 

	-- if keyJustPressed('accept') and songEnded == true then
	-- 	endSong()
	-- end
end

function onUpdatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		-- doTweenX(i..'x','unspawnNotes['..i..'].scale', 1, 0.1, 'linear')
		-- doTweenY(i..'y','unspawnNotes['..i..'].scale', 1, 0.1, 'linear')
		setPropertyFromGroup('unspawnNotes', i, 'scale.x', 4)
		setPropertyFromGroup('unspawnNotes', i, 'scale.y', 4)

		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then --Doesn't let Dad/Opponent notes get ignored
			setPropertyFromGroup('unspawnNotes', i, 'visible', false); --Miss has no penalties
			-- setPropertyFromGroup('unspawnNotes', i, 'scale.x', 6)
			-- setPropertyFromGroup('unspawnNotes', i, 'scale.y', 6)
		end
	end

	if middlescroll then
		doTweenAlpha('alphaLeft','strumLineNotes.members[0]',1,0.1,'linear')
		doTweenAlpha('alphaDown','strumLineNotes.members[1]',1,0.1,'linear')
		doTweenAlpha('alphaUp','strumLineNotes.members[2]',1,0.1,'linear')
		doTweenAlpha('alphaRight','strumLineNotes.members[3]',1,0.1,'linear')
	end

	setProperty('iconP1.x', getProperty('boxP2.x') - 28)
	setProperty('iconP1.y', getProperty('boxP2.y') - 32.5)
	scaleObject('iconP1',0.625,0.625)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		cancelTween('ratingTextAlpha')
		setProperty('ratingArcade.alpha',1)
		setTextString('ratingArcade', getPropertyFromGroup('notes',id,'rating'))
		doTweenAlpha('ratingTextAlpha','ratingArcade',0,0.5,'sineInOut')
	end
end

function onEvent(name, value1, value2)
	if name == "Switch To Radio" then
		if lights then
			lights = false
		else
			lights = true
		end
	end

	if name == "Finish Him" then
		-- if getProperty('health') >= 90.625 then
		makeLuaText('finish','Finish Him!', '', 385, 0)
		setTextFont('finish','arcaden.ttf')
		setTextSize('finish',25)
		setTextBorder('finish',0,'ffffff')
		screenCenter('finish','Y')
		addLuaText('finish')
		-- end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not comboStop and not isSustainNote then
		highestCombo = getProperty('combo');
		comboNum = 'C:'..string.format("%06d", highestCombo)
		setTextString('comboArcade', comboNum)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	comboStop = true
end

function healthUpdate()
	health = getProperty('healthBar.percent')
-- 16/16
	if health >= 50 and health < 53.125 then
		for i = 0, 16 do
			setProperty('p'..i..'.visible',true)
			setProperty('o'..i..'.visible',true)
		end

		for i = 17, 31 do
			setProperty('p'..i..'.visible',false)
			setProperty('o'..i..'.visible',false)
		end
-- 0/32
	elseif health >= 0 and health < 3.125 then
		for i = 0, 31 do
			setProperty('p'..i..'.visible',false)
			setProperty('o'..i..'.visible',true)
		end
-- 32/0
	elseif health >= 96.875 and health < 1 then
		for i = 0, 31 do
			setProperty('p'..i..'.visible',true)
			setProperty('o'..i..'.visible',false)
		end
-- 1/31
	elseif health >= 93.75 and health < 96.875 then
		for i = 0, 1 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 1, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 30 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 30, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 31/1
	elseif health >= 3.125 and health < 6.25 then
		for i = 0, 1 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 1, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 30 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 30, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 2/30
	elseif health >= 90.625 and health < 93.75 then
		for i = 0, 2 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 2, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 30 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 30, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 30/2
	elseif health >= 6.25 and health < 9.375 then
		for i = 0, 2 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 2, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 30 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 30, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 3/29
	elseif health >= 90.625 and health < 93.75 then
		for i = 0, 3 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 3, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 29 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 29, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 29/3
	elseif health >= 6.25 and health < 9.375 then
		for i = 0, 3 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 3, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 29 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 29, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 4/28
	elseif health >= 87.5 and health < 90.625 then
		for i = 0, 4 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 4, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 28 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 28, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 28/4
	elseif health >= 9.375 and health < 12.5 then
		for i = 0, 4 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 4, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 28 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 28, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 5/27
	elseif health >= 84.375 and health < 87.5 then
		for i = 0, 5 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 5, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 27 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 27, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 27/5
	elseif health >= 12.5 and health < 15.625 then
		for i = 0, 5 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 5, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 27 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 27, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 6/26
	elseif health >= 81.25 and health < 84.375 then
		for i = 0, 6 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 6, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 26 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 26, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 26/6
	elseif health >= 15.625 and health < 18.75 then
		for i = 0, 6 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 6, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 26 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 26, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 7/25
	elseif health >= 78.125 and health < 81.25 then
		for i = 0, 7 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 7, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 25 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 25, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 25/7
	elseif health >= 18.75 and health < 21.875 then
		for i = 0, 7 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 7, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 25 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 25, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 8/24
	elseif health >= 75 and health < 78.125 then
		for i = 0, 8 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 8, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 25 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 25, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 24/8
	elseif health >= 21.875 and health < 25 then
		for i = 0, 8 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 8, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 24 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 24, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 9/23
	elseif health >= 71.875 and health < 75 then
		for i = 0, 9 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 9, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 23 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 23, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 23/9
	elseif health >= 25 and health < 28.125 then
		for i = 0, 9 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 9, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 23 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 23, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 10/22
	elseif health >= 68.75 and health < 71.875 then
		for i = 0, 10 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 10, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 22 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 22, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 22/10
	elseif health >= 28.125 and health < 31.25 then
		for i = 0, 10 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 10, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 22 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 22, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 11/21
	elseif health >= 65.625 and health < 68.75 then
		for i = 0, 11 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 11, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 21 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 21, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 21/11
	elseif health >= 31.25 and health < 34.375 then
		for i = 0, 11 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 11, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 21 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 21, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 12/20
	elseif health >= 62.5 and health < 65.625 then
		for i = 0, 12 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 12, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 20 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 20, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 20/12
	elseif health >= 34.375 and health < 37.5 then
		for i = 0, 12 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 12, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 20 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 20, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 13/19
	elseif health >= 59.375 and health < 62.5 then
		for i = 0, 13 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 13, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 19 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 19, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 19/13
	elseif health >= 37.5 and health < 40.625 then
		for i = 0, 13 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 13, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 19 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 19, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 14/18
	elseif health >= 56.25 and health < 59.375 then
		for i = 0, 14 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 14, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 18 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 18, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 18/14
	elseif health >= 40.625 and health < 43.75 then
		for i = 0, 14 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 14, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 18 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 18, 31 do
			setProperty('o'..i..'.visible',false)
		end
-- 15/17
	elseif health >= 53.125 and health < 56.25 then
		for i = 0, 15 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 15, 31 do
			setProperty('o'..i..'.visible',false)
		end

		for i = 0, 17 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 17, 31 do
			setProperty('p'..i..'.visible',false)
		end
-- 17/15
	elseif health >= 43.75 and health < 46.875 then
		for i = 0, 15 do
			setProperty('p'..i..'.visible',true)
		end

		for i = 15, 31 do
			setProperty('p'..i..'.visible',false)
		end

		for i = 0, 17 do
			setProperty('o'..i..'.visible',true)
		end

		for i = 17, 31 do
			setProperty('o'..i..'.visible',false)
		end
	end
end

-- Thanks to Unholywanderer04 for the script
function getRating(diff, noteType, char) -- fused them, cuz they basically did the same thing
    if char == 'bf' then
        -- prevents rating so custom one can pop up, doesn't matter what it's called, just can't be sick, good, etc
        if noteType == specialType then return '' end

	    diff = math.abs(diff)
	    if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
	    	if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
	    		if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
	    			return 'sick'
	    		end
	    		return 'good'
	    	end
	    	return 'bad'
	    end
	    return 'shit'
    end
    if char == 'dad' then
        if noteType == specialType then return '' end

        if chanceGood >= 48 and randGoods == true then
            return 'good'
        elseif chanceBad >= 63 and randBads == true then
            return 'bad'
        elseif chanceShit >= 72 and randShits == true then
            return 'shit'
        else
            return 'sick'
        end
    end
end