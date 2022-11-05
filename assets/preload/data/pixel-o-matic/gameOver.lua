-- fakeGO = false

-- function onGameOver()
--     -- fakeGO = true
--     -- debugPrint(getProperty('isDead'))

--     -- if fakeGO then
--     -- 	setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
-- 	-- 	setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
-- 	-- 	setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
-- 	-- 	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
-- 	-- 	setProperty('vocals.volume', 0)

--     --     if keyJustPressed('accept') and fakeGO then
--     --         restartSong(true);
--     --     elseif keyJustPressed('back') and fakeGO then
--     --         exitSong(false)
--     --     end
--     -- end

--     -- return Function_Stop
-- end

-- function onCreate()
--     luaDebugMode = true
--     makeLuaSprite('gameOver','',0,0)
--     makeGraphic('gameOver',screenWidth,screenHeight,'000000')
--     setObjectCamera('gameOver','camOther')
--     addLuaSprite('gameOver')
--     setProperty('gameOver.visible', false)
--     makeLuaText('message','you and your friends are dead', 500, 0, 250)
--     setTextFont('message','arcaden.ttf')
--     setTextSize('message',30)
--     screenCenter('message','X')
--     addLuaText('message',true)
--     setObjectCamera('message', 'camOther')
--     setProperty('message.visible',false)

--     makeLuaText('urdead','game over', 500, 0, screenHeight - 250)
--     setTextFont('urdead','arcaden.ttf')
--     setTextSize('urdead',30)
--     screenCenter('urdead','X')
--     addLuaText('urdead',true)
--     setObjectCamera('urdead', 'camOther')
--     setProperty('urdead.visible',false)

--     -- for a default till I figure out all of the bugs
    
-- end

-- -- function onUpdate()

-- -- end

-- function onUpdatePost(elapsed)
--     -- -- debugPrint(getProperty('isDead'))
--     health = getProperty('health')
--     if health <= 0.05 then
--         fakeGO = true
--         canPause = false
--         -- debugPrint(fakeGO)
--         runTimer('dead')
--     end

--     if fakeGO == true then
--         playMusic('gameOver_1', 1, true)
--         objectPlayAnimation('boyfriend','singUp')
--         setProperty('gameOver.visible', true)
--         setProperty('message.visible', true)
--         setProperty('urdead.visible', true)
--         noteTweenAlpha('deadLeftP1',4,0,0.01,'linear')
--         noteTweenAlpha('deadDownP1',5,0,0.01,'linear')
--         noteTweenAlpha('deadUpP1',6,0,0.01,'linear')
--         noteTweenAlpha('deadRightP1',7,0,0.01,'linear')
--         -- runTimer('dead')

--     	setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
--         setPropertyFromClass('Conductor', 'songPosition', 0) -- it is counted by milliseconds, 1000 = 1 second
-- 		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
-- 		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
-- 		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
-- 		setProperty('vocals.volume', 0)
--         setProperty('paused',true)
--     end

--     if keyJustPressed('accept') and fakeGO == true then
--         playMusic('gameOverEnd_1', 1, false)
--         runTimer('restartSong')
--         -- restartSong(false);
--     elseif keyJustPressed('back') and fakeGO == true then
--         -- setPropertyFromClass('GameOverSubstate','loopSoundName','Menu_Theme')
--         exitSong(false);
--     end
-- end

-- function onSongStart()
--     -- debugPrint(getProperty('health'))
-- end

-- function noteMiss()
--     -- debugPrint(getProperty('health'))
-- end

-- function onTimerCompleted(tag)
--     if tag == 'dead' and fakeGO then
--         setProperty('gameOver.visible', true)
--         setProperty('message.visible', true)
--         setProperty('urdead.visible', true)
--         noteTweenAlpha('deadLeftP1',4,0,0.01,'linear')
--         noteTweenAlpha('deadDownP1',5,0,0.01,'linear')
--         noteTweenAlpha('deadUpP1',6,0,0.01,'linear')
--         noteTweenAlpha('deadRightP1',7,0,0.01,'linear')
--         setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
--         setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
--         setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
--     end

--     if tag == 'restartSong' then
--         restartSong(false);
--     end
-- end