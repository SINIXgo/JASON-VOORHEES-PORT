fakePaused = false
cSelected = false
rSelected = false
bSelected = false
lSelected = false
eSelected = false

canPause = true


local nHi = 0

function onGameOver()
    canPause = false
    -- debugPrint(canPause)
end

function onPause()
	-- Called when you press Pause while not on a cutscene/etc
	-- return Function_Stop if you want to stop the player from pausing the game
	return Function_Stop;
end

function onCreate()
	luaDebugMode = true
    precacheSound('pause')
	precacheSound('menu')
	precacheSound('select')
    makeLuaSprite('funniblackbg', '', 0, 0)
	makeGraphic('funniblackbg', 1280, 720, '000000')
	addLuaSprite('funniblackbg', true)
	setObjectCamera('funniblackbg', 'camOther')
	setProperty('funniblackbg.alpha', 0.4)
	setProperty('funniblackbg.visible', false)
    makeLuaSprite('blackBox', '', 0,0)
	makeGraphic('blackBox', 500, 400, '000000')
    screenCenter('blackBox')
	addLuaSprite('blackBox', true)
	setObjectCamera('blackBox', 'camOther')
	setProperty('blackBox.visible', false)

    if getPropertyFromClass('PlayState','chartingMode') then
    makeLuaText('resume','Resume',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 15)
    setTextFont('resume','arcaden.ttf')
    setTextSize('resume',30)
    addLuaText('resume',true)
    setObjectCamera('resume', 'camOther')
    setProperty('resume.visible',false)

    makeLuaText('restart','Restart',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 20 + getProperty('resume.height'))
    setTextFont('restart','arcaden.ttf')
    setTextSize('restart',30)
    addLuaText('restart',true)
    setObjectCamera('restart', 'camOther')
    setProperty('restart.visible',false)

    makeLuaText('botplay','Botplay',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 25 + getProperty('resume.height') + getProperty('restart.height'))
    setTextFont('botplay','arcaden.ttf')
    setTextSize('botplay',30)
    addLuaText('botplay',true)
    setObjectCamera('botplay', 'camOther')
    setProperty('botplay.visible',false)

    makeLuaText('leave','Leave Chart Mode',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 30 + getProperty('resume.height') + getProperty('restart.height') + getProperty('botplay.height'))
    setTextFont('leave','arcaden.ttf')
    setTextSize('leave',30)
    addLuaText('leave',true)
    setObjectCamera('leave', 'camOther')
    setProperty('leave.visible',false)    

    makeLuaText('exit','Exit',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 35 + getProperty('resume.height') + getProperty('restart.height') + getProperty('botplay.height') + getProperty('leave.height'))
    setTextFont('exit','arcaden.ttf')
    setTextSize('exit',30)
    addLuaText('exit',true)
    setObjectCamera('exit', 'camOther')
    setProperty('exit.visible',false)

    nHi = 50 + getProperty('resume.height') + getProperty('restart.height') + getProperty('exit.height') + getProperty('botplay.height') + getProperty('leave.height')
    
    setProperty('blackBox.scale.y', nHi / getProperty('blackBox.height'))
    setProperty('resume.y', getProperty('blackBox.y') + 105)
    setProperty('restart.y', getProperty('blackBox.y') + getProperty('resume.height') + 110)
    setProperty('botplay.y', getProperty('blackBox.y') + getProperty('resume.height') + getProperty('restart.height') + 115)
    setProperty('leave.y', getProperty('blackBox.y') + getProperty('resume.height') + getProperty('restart.height') + getProperty('botplay.height') + 120)
    setProperty('exit.y', getProperty('blackBox.y') + getProperty('resume.height') + getProperty('restart.height') + getProperty('botplay.height') + getProperty('leave.height') + 125)

    else --If NOT in Charting Mode

    makeLuaText('resume','Resume',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 15)
    setTextFont('resume','arcaden.ttf')
    setTextSize('resume',30)
    addLuaText('resume',true)
    setObjectCamera('resume', 'camOther')
    setProperty('resume.visible',false)

    makeLuaText('restart','Restart',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 20 + getProperty('resume.height'))
    setTextFont('restart','arcaden.ttf')
    setTextSize('restart',30)
    addLuaText('restart',true)
    setObjectCamera('restart', 'camOther')
    setProperty('restart.visible',false)

    makeLuaText('exit','Exit',getProperty('blackBox.width'),getProperty('blackBox.x'),getProperty('blackBox.y') + 25 + getProperty('resume.height') + getProperty('restart.height'))
    setTextFont('exit','arcaden.ttf')
    setTextSize('exit',30)
    addLuaText('exit',true)
    setObjectCamera('exit', 'camOther')
    setProperty('exit.visible',false)

    nHi = 40 + getProperty('resume.height') + getProperty('restart.height') + getProperty('exit.height')
    
    setProperty('blackBox.scale.x', 0.6)
    setProperty('blackBox.scale.y', nHi / getProperty('blackBox.height'))
    setProperty('resume.y', getProperty('blackBox.y') + nHi)
    setProperty('restart.y', getProperty('blackBox.y') + nHi + getProperty('resume.height') + 5)
    setProperty('exit.y', getProperty('blackBox.y') + nHi + getProperty('resume.height') + getProperty('restart.height') + 10)
    end
	makeLuaSprite('fakeTimeBar', '', -1007, 203)
	makeGraphic('fakeTimeBar', 390, 11, 'FF0000')
	addLuaSprite('fakeTimeBar', true)
	setObjectCamera('fakeTimeBar', 'camOther')

    setProperty('skipCountdown', true)
end

function onCountdownTick(counter)
    if fakePaused then
        return Function_Stop;
    else
        return Function_Continue;
    end
end

function onBeatHit()
    -- triggerEvent('Add Camera Zoom', '', '')
end

function onSongStart()
    -- debugPrint(getProperty('paused'))
end

function onUpdatePost(elapsed)
	if keyJustPressed('accept') and fakePaused == false and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and canPause then
    	-- doTweenX('fakeTimeBarTween', 'fakeTimeBar', 207, 0.2, 'linear')
        playSound('pause', 0.8, 'pause')
    	cSelected = true
		rSelected = false
		eSelected = false
		fakePaused = true
        setProperty('paused',true)
        -- debugPrint(getProperty('resume.height'))
    elseif keyJustPressed('accept') and fakePaused == true and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and canPause then
        -- exitSong(true)
        select()
    elseif keyJustPressed('back') and fakePaused == true and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and canPause then
    	setProperty('blackBox.visible', false)
        setProperty('resume.visible',false)
        setProperty('restart.visible',false)
        setProperty('exit.visible',false)
        if getPropertyFromClass('PlayState','chartingMode') then
            setProperty('botplay.visible',false)
            setProperty('leave.visible',false) 
        end
        -- playSound('select', 1, 'unpause')
		setProperty('vocals.volume', 1)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		doTweenX('pauseRightTween2', 'pauseRight', 800, 0.2, 'linear')
		doTweenX('pauseLeftTween2', 'pauseLeft', -800, 0.2, 'linear')
		doTweenX('fakeTimeBarTween2', 'fakeTimeBar', -800, 0.2, 'linear')
		-- doTweenX('cTween2', 'continue', 800, 0.2, 'linear')
		-- doTweenX('rTween', 'restart', 800, 0.2, 'linear')
		-- doTweenX('eTween', 'exist', 800, 0.2, 'linear')
		doTweenX('pauseIconTween', 'pauseIcon', -800, 1, 'circInOut')
		doTweenAngle('pauseIconTweenAng', 'pauseIcon', 180, 1, 'circInOut')
		cSelected = false
		rSelected = false
		eSelected = false
        bSelected = false
        lSelected = false
		fakePaused = false
        setProperty('paused',false)
    -- elseif keyJustPressed('space') and fakePaused == true and canPause then
        -- doTweenAlpha('gameFade','camGame',0,1,'linear')
        -- restartSong(true);
    end

    health = getProperty('health')
    if canPause and health <= 0.05 then
        canPause = false
    end

    -- if

    if fakePaused == true then
		-- setProperty('funniblackbg.visible', true)
        setProperty('blackBox.visible', true)
        setProperty('resume.visible',true)
        setProperty('restart.visible',true)
        setProperty('exit.visible',true)
        if getPropertyFromClass('PlayState','chartingMode') then
            setProperty('botplay.visible',true)
            setProperty('leave.visible',true) 
        end
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)

        for i = 0, getProperty('strumLineNotes.length')-1 do
            setPropertyFromGroup('strumLineNotes',i,'animation.paused',true)
        end
	elseif fakePaused == false and canPause then
		setProperty('funniblackbg.visible', false)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
        for i = 0, getProperty('strumLineNotes.length')-1 do
            setPropertyFromGroup('strumLineNotes',i,'animation.paused',false)
        end
	end

    setColor()
    scroll()
    keyDefault()
end

function keyDefault()
    if fakePaused then
        if keyJustPressed('down') then
            -- debugPrint(getProperty('strumLineNotes.members[5].animation.name'))
            -- setPropertyFromGroup('strumLineNotes', 5, 'name', 'static')
            objectPlayAnimation('strumLineNotes.members[5]','static')
        end
    end
end

function setColor()
    if cSelected then
        setTextColor('resume','00FFFF')
        setTextColor('restart','FFFFFF')
        setTextColor('exit','FFFFFF')
        if getPropertyFromClass('PlayState','chartingMode') then
            setTextColor('botplay','FFFFFF')
            setTextColor('leave','FFFFFF')            
        end
    elseif rSelected then
        setTextColor('resume','FFFFFF')
        setTextColor('restart','00FFFF')
        setTextColor('exit','FFFFFF')
        if getPropertyFromClass('PlayState','chartingMode') then
            setTextColor('botplay','FFFFFF')
            setTextColor('leave','FFFFFF')            
        end
    elseif bSelected then
        setTextColor('resume','FFFFFF')
        setTextColor('restart','FFFFFF')
        setTextColor('exit','FFFFFF')
        if getPropertyFromClass('PlayState','chartingMode') then
            setTextColor('botplay','00FFFF')
            setTextColor('leave','FFFFFF')            
        end
    elseif lSelected then
        setTextColor('resume','FFFFFF')
        setTextColor('restart','FFFFFF')
        setTextColor('exit','FFFFFF')
        if getPropertyFromClass('PlayState','chartingMode') then
            setTextColor('botplay','FFFFFF')
            setTextColor('leave','00FFFF')            
        end
    elseif eSelected then
        setTextColor('resume','FFFFFF')
        setTextColor('restart','FFFFFF')
        setTextColor('exit','00FFFF')
        if getPropertyFromClass('PlayState','chartingMode') then
            setTextColor('botplay','FFFFFF')
            setTextColor('leave','FFFFFF')            
        end
    end
end

function scroll()
    if keyJustPressed('down') and fakePaused == true then
        playSound('menu', 1, 'scroll')
    if getPropertyFromClass('PlayState','chartingMode') then
            if cSelected then
			    cSelected = false
			    rSelected = true
            elseif eSelected then
			    eSelected = false
			    cSelected = true
            elseif rSelected then
			    rSelected = false
			    bSelected = true
            elseif bSelected then
			    bSelected = false
			    lSelected = true
            elseif lSelected then
			    lSelected = false
			    eSelected = true             
            end
        else
            if cSelected then
			    cSelected = false
			    rSelected = true
            elseif eSelected then
			    eSelected = false
			    cSelected = true
            elseif rSelected then
			    rSelected = false
			    eSelected = true
            end
        end
    end

    if keyJustPressed('up') and fakePaused == true then
        playSound('menu', 1, 'scroll')
        if getPropertyFromClass('PlayState','chartingMode') then
            if cSelected then
			    cSelected = false
			    eSelected = true
            elseif rSelected then
			    rSelected = false
			    cSelected = true
            elseif eSelected then
			    eSelected = false
			    lSelected = true
            elseif bSelected then
			    bSelected = false
			    rSelected = true
            elseif lSelected then
			    lSelected = false
			    bSelected = true             
            end
        else
            if cSelected then
			    cSelected = false
			    eSelected = true
            elseif rSelected then
			    rSelected = false
			    cSelected = true
            elseif eSelected then
			    eSelected = false
			    rSelected = true
            end
        end
    end
end

function select()
    playSound('select', 1, 'unpause')
    if cSelected then
    	-- setProperty('blackBox.visible', false)
        -- setProperty('resume.visible',false)
        -- setProperty('restart.visible',false)
        -- setProperty('exit.visible',false)
        -- if getPropertyFromClass('PlayState','chartingMode') then
        --     setProperty('botplay.visible',false)
        --     setProperty('leave.visible',false) 
        -- end
        -- -- playSound('pauseSounds/unpause', 1, 'unpause')
		-- -- setProperty('vocals.volume', 1)
		-- -- setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		-- -- doTweenX('pauseRightTween2', 'pauseRight', 800, 0.2, 'linear')
		-- -- doTweenX('pauseLeftTween2', 'pauseLeft', -800, 0.2, 'linear')
		-- -- doTweenX('fakeTimeBarTween2', 'fakeTimeBar', -800, 0.2, 'linear')
		-- -- doTweenX('cTween2', 'continue', 800, 0.2, 'linear')
		-- -- doTweenX('rTween', 'restart', 800, 0.2, 'linear')
		-- -- doTweenX('eTween', 'exist', 800, 0.2, 'linear')
		-- -- doTweenX('pauseIconTween', 'pauseIcon', -800, 1, 'circInOut')
		-- -- doTweenAngle('pauseIconTweenAng', 'pauseIcon', 180, 1, 'circInOut')
		-- cSelected = false
		-- rSelected = false
		-- eSelected = false
        -- bSelected = false
        -- lSelected = false
        -- fakePaused = false
        -- setProperty('paused',false)
        doTweenAlpha('resumeFlash1','resume',0,0.05,'linear')
        runTimer('resume')
    elseif rSelected then
        doTweenAlpha('restartFlash1','restart',0,0.05,'linear')
        runTimer('restart')
    elseif bSelected then
        if not getProperty('cpuControlled') then
            setProperty('cpuControlled',true)
            setProperty('changedDifficulty',true)
            setProperty('botplayTxt.visible',true)
            setProperty('botplayTxt.alpha',1)
        else
            setProperty('cpuControlled',false)
            setProperty('changedDifficulty',true)
            setProperty('botplayTxt.visible',false)
            setProperty('botplayTxt.alpha',1)    
        end 
    elseif lSelected then
        doTweenAlpha('chartFlash1','leave',0,0.05,'linear')
        runTimer('chart')
    elseif eSelected then
        doTweenAlpha('exitFlash1','exit',0,0.05,'linear')
        runTimer('exit')
    end
end

function onTweenCompleted(tag)
    if tag == 'gameFade' then
        restartSong(true);    
    end

    if tag == 'resumeFlash1' then
        doTweenAlpha('resumeFlash2','resume',1,0.05,'linear')
    end

    if tag == 'resumeFlash2' then
        doTweenAlpha('resumeFlash1','resume',0,0.05,'linear')
    end

    if tag == 'restartFlash1' then
        doTweenAlpha('restartFlash2','restart',1,0.05,'linear')
    end

    if tag == 'restartFlash2' then
        doTweenAlpha('restartFlash1','restart',0,0.05,'linear')
    end

    if tag == 'exitFlash1' then
        doTweenAlpha('exitFlash2','exit',1,0.05,'linear')
    end

    if tag == 'exitFlash2' then
        doTweenAlpha('exitFlash1','exit',0,0.05,'linear')
    end

    if tag == 'chartFlash1' then
        doTweenAlpha('chartFlash2','leave',1,0.05,'linear')
    end

    if tag == 'chartFlash2' then
        doTweenAlpha('chartFlash1','leave',0,0.05,'linear')
    end
end

function onTimerCompleted(tag)
    if tag == 'resume' then
        cancelTween('resumeFlash1')
        cancelTween('resumeFlash2')
    	setProperty('blackBox.visible', false)
        setProperty('resume.visible',false)
        setProperty('restart.visible',false)
        setProperty('exit.visible',false)
        if getPropertyFromClass('PlayState','chartingMode') then
            setProperty('botplay.visible',false)
            setProperty('leave.visible',false) 
        end
        -- playSound('pauseSounds/unpause', 1, 'unpause')
		-- setProperty('vocals.volume', 1)
		-- setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		-- doTweenX('pauseRightTween2', 'pauseRight', 800, 0.2, 'linear')
		-- doTweenX('pauseLeftTween2', 'pauseLeft', -800, 0.2, 'linear')
		-- doTweenX('fakeTimeBarTween2', 'fakeTimeBar', -800, 0.2, 'linear')
		-- doTweenX('cTween2', 'continue', 800, 0.2, 'linear')
		-- doTweenX('rTween', 'restart', 800, 0.2, 'linear')
		-- doTweenX('eTween', 'exist', 800, 0.2, 'linear')
		-- doTweenX('pauseIconTween', 'pauseIcon', -800, 1, 'circInOut')
		-- doTweenAngle('pauseIconTweenAng', 'pauseIcon', 180, 1, 'circInOut')
		cSelected = false
		rSelected = false
		eSelected = false
        bSelected = false
        lSelected = false
        fakePaused = false
        setProperty('paused',false)
        setProperty('resume.alpha',1)
    end

    if tag == 'restart' then
        restartSong(false);
    end

    if tag == 'exit' then
        exitSong(false)
    end

    if tag == 'chart' then
        setProperty('cpuControlled',false)
        setPropertyFromClass('PlayState','chartingMode', false)
        restartSong(false); 
    end
end
