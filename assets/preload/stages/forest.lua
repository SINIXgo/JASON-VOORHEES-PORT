local y = 50
local t = 0
-- stolen from bbpanzu lol -Uhard
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 600;
local yy = 375;
local xx2 = 750;
local yy2 = 400;
local ofs = 75;
local blast = 300;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
local allowCountdown = false

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

    makeLuaSprite('grass','stages/forest/Grass', -1000, 550)
	-- scaleObject('grass', 0.875, 0.875);
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

function onUpdate()
	if followchars == true then
        if mustHitSection == false then
            --setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            --setProperty('defaultCamZoom',0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'shootLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'shootRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'shootUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'shootDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

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

function onEvent(name, value1, value2)
    if name == 'You Bastard' then
        followchars = false
        runTimer('escape',1)
        runTimer('back',2)
    end
end

function onTimerCompleted(tag)
    if tag == 'escape' then
        setProperty('boyfriend.alpha',0)
        setProperty('gf.alpha',0)
    end

    if tag == 'back' then
        followchars = true
    end
end
