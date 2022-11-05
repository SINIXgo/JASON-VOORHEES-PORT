function onCreate()
	makeLuaSprite('trees-bg1', 'stages/forest/Forest_BG_1', -1000, -800);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-bg1', 0.5, 0.5);
	setProperty('trees-bg1.antialiasing', true);
	-- addLuaSprite('trees-bg1')

	makeLuaSprite('trees-bg2', 'stages/forest/Forest_BG_2', 0, -800);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-bg2', 0.5, 0.5);
	setProperty('trees-bg2.antialiasing', true);
	-- addLuaSprite('trees-bg2')

	makeLuaSprite('trees-bg3', 'stages/forest/Forest_1_long', -1250, -800);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-bg3', 0.5, 0.5);
	setProperty('trees-bg3.antialiasing', true);
	addLuaSprite('trees-bg3')

	makeLuaSprite('trees-one', 'stages/forest/Forest_1_long', -1000, -800);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-one', 0.75, 0.75);
	setProperty('trees-one.antialiasing', true);
	addLuaSprite('trees-one')
	
	makeLuaSprite('grass', 'stages/forest/Grass_long', -100, 600);
	scaleObject('grass', 1.25, 1.25);
	setScrollFactor('grass', 1, 1);
	setProperty('grass.antialiasing', true);
	addLuaSprite('grass')

	if boyfriendName=='bf-walk' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'chase-death');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/chasedeath'); --Character json file for the death animation
	end
	-- background shit
	-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCreatePost()
	setProperty('dad.visible',false)
	setProperty('iconP2.visible',false)

	-- if boyfriendName == 'bf-walk' then
    --     makeAnimatedLuaSprite('body','characters/Body_BoyFriend_Assets_walk', getProperty('boyfriend.x')+30, getProperty('boyfriend.y') + 180)
    --     addAnimationByPrefix('body', 'idle', 'Body BF idle dance', 24, true)
    --     addAnimationByPrefix('body', 'right', 'Body BF NOTE RIGHT', 24, true)
    --     objectPlayAnimation('body','idle')
    --     addLuaSprite('body')
    -- end

    --     makeAnimatedLuaSprite('gfBody','characters/Body_GF_Assets_walk', getProperty('boyfriend.x')-125, getProperty('boyfriend.y'))
    --     addAnimationByPrefix('gfBody', 'idle', 'Body GF idle dance', 24, true)
    --     objectPlayAnimation('gfBody','idle')
    --     addLuaSprite('gfBody',true)

    --     makeAnimatedLuaSprite('gfFace','characters/GF_Assets_walk', getProperty('boyfriend.x')-100, getProperty('boyfriend.y')+75)
    --     addAnimationByPrefix('gfFace', 'idle', 'GF idle dance', 24, true)
    --     addAnimationByIndices('gfFace', 'left', 'GF NOTE LEFT', '0,1,2,3,4,5,6,7,8,9,10,11,12,13')
    --     addAnimationByPrefix('gfFace', 'leftMISS', 'GF NOTE LEFT MISS', 24, false)
    --     addAnimationByIndices('gfFace', 'down', 'GF NOTE DOWN', '0,1,2,3,4,5,6,7,8,9,10,11,12,13')
    --     addAnimationByPrefix('gfFace', 'downMISS', 'GF NOTE DOWN MISS', 24, false)
    --     addAnimationByIndices('gfFace', 'up', 'GF NOTE UP', '0,1,2,3,4,5,6,7,8,9,10,11,12,13')
    --     addAnimationByPrefix('gfFace', 'upMISS', 'GF NOTE UP MISS', 24, false)
    --     addAnimationByIndices('gfFace', 'right', 'GF NOTE RIGHT', '0,1,2,3,4,5,6,7,8,9,10,11,12,13')
    --     addAnimationByPrefix('gfFace', 'rightMISS', 'GF NOTE RIGHT MISS', 24, false)
    --     objectPlayAnimation('gfFace','idle')
    --     addLuaSprite('gfFace',true)



    removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
end


function onStartCountdown()
-- I have to put the fog in here
	makeAnimatedLuaSprite('fog1', 'stages/forest/Fog_1', -200, 600);
	addAnimationByPrefix('fog1', 'Fog', 'Fog 1', 24, true);
	objectPlayAnimation('fog1','Fog');
	setProperty('fog1.antialiasing', true);
	addLuaSprite('fog1',true)

	makeAnimatedLuaSprite('fog2', 'stages/forest/Fog_1', 4631, 600);
	-- makeAnimatedLuaSprite('fog2', 'stages/forest/Fog_2', 0, 450);
	addAnimationByPrefix('fog2', 'Fog', 'Fog 1', 24, true);
	objectPlayAnimation('fog2','Fog');
	setProperty('fog2.antialiasing', true);
	addLuaSprite('fog2',true)

	doTweenX('grassRun', 'grass', -5884, 15, 'linear')
	doTweenX('treeRun', 'trees-one', -5138, 15, 'linear')
	doTweenX('bgTreeRun', 'trees-bg3', -5138, 120, 'linear')
	doTweenX('fogOneTween','fog1',-4431,15,'linear')
	doTweenX('fogTwoTween','fog2',-200,15,'linear')
	doTweenY('cameraUp','camGame', -25, 0.375, 'sinInOut')
end

function onTweenCompleted(tag)
	if tag == 'cameraUp' then
		doTweenY('cameraDown','camGame', 0, 0.375, 'sinInOut')
	end

	if tag == 'cameraDown' then
		doTweenY('cameraUp','camGame', -25, 0.375, 'sinInOut')
	end
	if tag == 'grassRun' then
		doTweenX('grassReset', 'grass', -100, 0.01, 'linear')
	end
	if tag == 'grassReset' then
		doTweenX('grassRun', 'grass', -5884, 15, 'linear')
	end
	if tag == 'treeRun' then
		doTweenX('treeReset', 'trees-one', -1000, 0.01, 'linear')
	end

	if tag == 'treeReset' then
		doTweenX('treeRun', 'trees-one', -5138, 15, 'linear')
	end

	if tag == 'fogOneTween' then
		doTweenX('fogOneTweenBack','fog1',-200,0.01,'linear')
	end

	if tag == 'fogTwoTween' then
		doTweenX('fogTwoTweenBack','fog2',4631,0.01,'linear')
	end

	if tag == 'fogOneTweenBack' then
		doTweenX('fogOneTween','fog1',-4431,15,'linear')
	end

	if tag == 'fogTwoTweenBack' then
		doTweenX('fogTwoTween','fog2',-200,15,'linear')
	end
end

function onGameOver()
	triggerEvent('Camera Follow Pos','','')
	return Function_Continue;
end