function onCreate()
    makeLuaSprite('forestfour','stages/forest/Forest_1', -1200, -300)
    setScrollFactor('forestfour',0.4,0.9)
	-- scaleObject('grass', 0.875, 0.875);
	-- addLuaSprite('forestfour')

    makeLuaSprite('forestthree','stages/forest/Forest_1', -400, -100)
    setScrollFactor('forestthree',0.5,0.9)
	-- scaleObject('grass', 0.875, 0.875);
	-- addLuaSprite('forestthree')

    makeLuaSprite('foresttwo','stages/forest/Forest_BG_2', -200, -300)
    setScrollFactor('foresttwo',0.7,0.9)
	-- scaleObject('grass', 0.875, 0.875);
	addLuaSprite('foresttwo')
    -- close(true)

    makeLuaSprite('forestone','stages/forest/Forest_BG_1', -1000, -840)
    setScrollFactor('forestone',0.8,0.9)
	-- scaleObject('grass', 0.875, 0.875);
	addLuaSprite('forestone')
    -- close(true)

    makeLuaSprite('grass','stages/forest/Grass_alt', -1000, 550)
	-- scaleObject('grass', 0.8, 0.8);
	addLuaSprite('grass')

    -- makeLuaSprite('forestthree','stages/forest/Forest_BG_1', -2000, -1250)
    -- setScrollFactor('forestthree',0.6,1)
	-- scaleObject('forestthree', 1.5, 1.5);
	-- addLuaSprite('forestthree',true)
    -- close(true)
    makeAnimatedLuaSprite('fog1', 'stages/forest/Fog_1', -700, 700);
	addAnimationByPrefix('fog1', 'Fog', 'Fog 1', 24, true);
	objectPlayAnimation('fog1','Fog');
    setProperty('fog1.alpha',0.75);
	setProperty('fog1.antialiasing', true);
	addLuaSprite('fog1',true)

    setPropertyFromClass('GameOverSubstate', 'characterName', 'pico-split');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/picodeath');
end

function onUpdate()
    if mustHitSection then
        doTweenZoom('camZoomOut','camGame',1,0.1,'sineInOut')
        setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
        -- setProperty("defaultCamZoom",0.8) 
    else
        doTweenZoom('camZoomIn','camGame',1.3,0.1,'sineInOut')
        setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
        -- setProperty("defaultCamZoom",1) 
    end
end

function onCreatePost()
    removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
    -- close(true)
end

function onStartCountdown()
    doTweenX('slowFog', 'fog1', -4431, 500, 'linear')
    return Function_Continue
end

-- function onMoveCamera(focus)
--     if focus == 'boyfriend' then
-- 		-- called when the camera focus on boyfriend
--         doTweenZoom('camZoomIn','camGame',0.9,0.5,'sineInOut')
-- 	elseif focus == 'dad' then
-- 		doTweenZoom('camZoomIn','camGame',1,0.5,'sineInOut')
-- 	end
-- end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Pico Shoot Notes' then
        cancelTween('grassColor')
        cancelTween('treeoneColor')
        cancelTween('treetwoColor')
        cancelTween('treethreeColor')
        cancelTween('treefourColor')
        doTweenColor('grassColor', 'grass', '1d4348', 0.25, 'linear')
        doTweenColor('treeoneColor', 'forestone', '1d4348', 0.25, 'linear')
        doTweenColor('treetwoColor', 'foresttwo', '1d4348', 0.25, 'linear')
        doTweenColor('treethreeColor', 'forestthree', '1d4348', 0.25, 'linear')
        doTweenColor('treefourColor', 'forestfour', '1d4348', 0.25, 'linear')
        -- doTweenColor('jasonColor', 'dad', '1d4348', 0.25, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'grassColor' then
        doTweenColor('grassColorBack', 'grass', 'FFFFFF', 0.25, 'linear')
        doTweenColor('forestoneColor', 'forestone', 'FFFFFF', 0.25, 'linear')
        doTweenColor('foresttwoColor', 'foresttwo', 'FFFFFF', 0.25, 'linear')
        doTweenColor('forestthreeColor', 'forestthree', 'FFFFFF', 0.25, 'linear')
        doTweenColor('forestfourColor', 'forestfour', 'FFFFFF', 0.25, 'linear')
        -- doTweenColor('dadColor', 'dad', 'FFFFFF', 0.25, 'linear')
    end
end
