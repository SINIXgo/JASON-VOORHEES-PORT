function onCreate()
    setProperty('gf.visible', false)
    -- setTextFont('scoreTxt','arcaden.ttf')
    -- setTextFont('timeTxt','arcaden.ttf')
    -- setTextFont('botplayTxt','arcaden.ttf')
    -- setProperty('iconP2.alpha',0)
    -- setProperty('iconP1.alpha',0)
    -- setProperty('healthBar.alpha',0)
    -- setProperty('healthBarBG.alpha',0)
end

-- function onStartCountdown()
--     -- setPropertyFromClass('Application','current.window.width',640)
--     -- setPropertyFromClass('Application','current.window.height',360)
--     -- setPropertyFromClass('Application','current.window.fullscreen',true)
--     triggerEvent("Camera Follow Pos", 1250, 1650)
--     return Function_Continue;
-- end

function onSongStart()
    -- debugPrint(inChartEditor)
    -- for i = 0, getProperty('playerStrums.length')-1 do
    --     debugPrint(getPropertyFromGroup('playerStrums', i, 'x'))
    -- end
end

-- function onEndSong()
--     -- setPropertyFromClass('Application','current.window.width',1280)
--     -- setPropertyFromClass('Application','current.window.height',720)
--     -- setPropertyFromClass('Application','current.window.fullscreen',false)
-- 	return Function_Continue;
-- end

-- allowEnd = false

-- function onEndSong()
-- 	if not allowEnd then
-- 		startVideo('end');
-- 		setProperty('vocals.volume', 0)
--         makeLuaSprite('blackScreen', '', 0,0)
-- 	    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
--         screenCenter('blackScreen')
-- 	    setObjectCamera('blackScreen', 'camOther')
--         addLuaSprite('blackScreen')
-- 		allowEnd = true;
-- 		return Function_Stop;
-- 	end
-- 	return Function_Continue;
-- end