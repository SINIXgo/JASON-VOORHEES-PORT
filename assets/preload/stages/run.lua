local cabin = false;

local y = 50
local t = 0
-- stolen from bbpanzu lol -Uhard
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1600;
local yy = 1292;
local xx2 = 1200;
local yy2 = 1162;
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne

local bop = false;

function onCreate()

	makeLuaSprite('trees-one', 'stages/forest/Forest_1_long_alt', -1000, -750);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-one', 0.75, 0.75);
	setProperty('trees-one.antialiasing', true);
	setObjectOrder('trees-one', 0);

	makeLuaSprite('grass', 'stages/forest/Grass_long_alt', -100, 600);
	scaleObject('grass', 1.25, 1.25);
	setScrollFactor('grass', 1, 1);
	setProperty('grass.antialiasing', true);
	setObjectOrder('grass', 1);
	if boyfriendName == 'bf-run' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-run-death');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/bfdeath');
		makeAnimatedLuaSprite('Body', 'characters/Body_BoyFriend_Assets_run', 0, 0);
		-- scaleObject('Body', 1, 1);
		addAnimationByPrefix('Body', 'Run', 'Body BF Idle dance', 24, true);
		addAnimationByPrefix('Body', 'Dodge', 'Body Boyfriend Dodge 2', 24, true);
		objectPlayAnimation('Body','Run')
		setScrollFactor('Body', 1.05, 1.05);
		setProperty('Body.antialiasing', true);
		-- addLuaSprite('Body', false)
		setObjectOrder('Body', 3);

		makeAnimatedLuaSprite('Arm', 'characters/Arms_BoyFriend_Assets_run', 0, 0);
		-- scaleObject('Body', 1, 1);
		addAnimationByPrefix('Arm', 'Dodge', 'Arms Boyfriend Dodge 2', 24, true);
		addAnimationByPrefix('Arm', 'Run', 'Arms BF Idle', 24, true);
		setScrollFactor('Arm', 1.05, 1.05);
		setProperty('Arm.antialiasing', true);
		setObjectOrder('Arm', 10);
	end

	if dadName =='jason-run' then
		makeAnimatedLuaSprite('Jason-Body', 'characters/Jasons_run_legs', 0, 0);
		scaleObject('Jason-Body', 1.2, 1.2);
		addAnimationByPrefix('Jason-Body', 'Run', 'Running legs', 24, true);
		objectPlayAnimation('Jason-Body','Run')
		setScrollFactor('Jason-Body', 1.05, 1.05);
		setProperty('Jason-Body.antialiasing', true);
		-- addLuaSprite('Body', false)
		setObjectOrder('Jason-Body', 4);
	end
		-- makeAnimatedLuaSprite('Fog1', 'stages/jasonnerd/Fog_1', 0, 650);
		-- addAnimationByPrefix('Fog1', 'Fog', 'Fog 1', 24, true);
		-- setProperty('Fog1.alpha',0.5)
		-- setObjectOrder('Fog1', 95);

		-- makeAnimatedLuaSprite('Fog2', 'stages/forest/Fog_2', 3000, 650);
		-- addAnimationByPrefix('Fog2', 'Fog', 'Fog 2', 24, true);
		-- setProperty('Fog2.alpha',0.5)
		-- setObjectOrder('Fog2', 96);

		makeLuaSprite('treefg-one', 'stages/forest/Forest 2 alt', 15000, -1050);
		scaleObject('treefg-one', 1.25, 1.25);
		setScrollFactor('treefg-one', 0, 0);
		setProperty('treefg-one.antialiasing', true);
		setObjectOrder('treefg-one', 97);

		makeLuaSprite('treefg-two', 'stages/forest/Bush', 75000, 300);
		scaleObject('treefg-two', 1.25, 1.25);
		setScrollFactor('treefg-two', 0, 0);
		setProperty('treefg-two.antialiasing', true);
		setObjectOrder('treefg-two', 98);

		makeLuaSprite('treefg-three', 'stages/forest/Forest 2 alt', 60000, -1050);
		scaleObject('treefg-three', 1.25, 1.25);
		setScrollFactor('treefg-three', 0, 0);
		setProperty('treefg-three.antialiasing', true);
		setObjectOrder('treefg-three', 99);

		makeLuaSprite('treefg', 'stages/forest/Trees_Foreground', 2500, -1250);
		scaleObject('treefg', 1.5, 1.5);
		setScrollFactor('treefg', 0, 0);
		setProperty('treefg.antialiasing', true);
		setObjectOrder('treefg', 100);
		setProperty('treefg.alpha',0);
		-- if songName == 'final-demise' then
		-- 	setProperty('skipCountdown', true)
		-- end

		makeLuaSprite('treestart', 'stages/forest/Forest_Transition', -2000, -1250);
		scaleObject('treestart', 1.5, 1.5);
		setScrollFactor('treestart', 0, 0);
		setProperty('treestart.antialiasing', true);
		setObjectOrder('treestart', 101);
		-- -2000 to -7500

		addCharacterToList('gf-radio', 'boyfriend')
		addCharacterToList('radiopico', 'dad')
		precacheImage('stages/cabin/Background')
		precacheImage('stages/cabin/Table')

		makeLuaSprite('cabin-wall', 'stages/cabin/Background', -1000, 0);
		setScrollFactor('cabin-wall', 0.5, 0.5);
		setProperty('cabin-wall.antialiasing', true);
		setObjectOrder('cabin-wall', 1);
		setProperty('cabin-wall.alpha',0);

		makeLuaSprite('cabin-table', 'stages/cabin/Table', 600, 1450);
		setScrollFactor('cabin-table', 1, 1);
		setProperty('cabin-table.antialiasing', true);
		setObjectOrder('cabin-table', 2);
		setProperty('cabin-table.alpha',0);
		
	-- setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-run-death');
	-- setPropertyFromClass('GameOverSubstate', 'camFollow.x', 100);
	-- setPropertyFromClass('GameOverSubstate', 'camFollow.y', 100);
	-- close(true);
end

function onCreatePost()
	if boyfriendName == 'bf-run' then
		setProperty('Body.x',getProperty('boyfriend.x') - 150)
		setProperty('Body.y',getProperty('boyfriend.y') + 162.5)
		setProperty('Arm.x',getProperty('boyfriend.x') - 75)
		setProperty('Arm.y',getProperty('boyfriend.y') + 162.5)
	end

	if dadName == 'jason-run' then
		setProperty('Jason-Body.x',getProperty('dad.x')-20)
		setProperty('Jason-Body.y',getProperty('dad.y')+300)
	end

    removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
end

function onSongStart()
	-- debugPrint(getPropertyFromGroup('ratingsData', 0, 'name'))
	-- debugPrint(getProperty('healthBar.percent'))
	-- debugPrint(getProperty('ratingsData.length'))
end

-- function goodNoteHit(id, direction, noteType, isSustainNote)
-- 	-- Function called when you hit a note (after note hit calculations)
-- 	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- 	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- 	-- noteType: The note type string/tag
-- 	-- isSustainNote: If it's a hold note, can be either true or false
-- 	-- debugPrint(id)
-- 	-- if not isSustainNote then
-- 	-- 	debugPrint(math.abs(id - getPropertyFromClass('Conductor','songPosition') + getPropertyFromClass('ClientPrefs','ratingOffset')))
-- 	-- end
-- 	debugPrint(getPropertyFromGroup('notes',id,'rating'))
-- end


function onStartCountdown()
	if songName == 'final-demise' then
		-- triggerEvent('Cinemax', 5)
	end
	-- triggerEvent('Camera Follow Pos', 975, 400)
	doTweenX('grassRun', 'grass', -5884, 1, 'linear')
	doTweenX('treeRun', 'trees-one', -5138, 1.5, 'linear')
	doTweenX('treeFore1Run', 'treefg-one', -15000, 3, 'linear')
	doTweenX('treeFore2Run', 'treefg-two', 45000, 3, 'linear')
	doTweenX('treeFore3Run', 'treefg-three', -15000, 5, 'linear')
	-- doTweenX('fog1Run', 'Fog1', -7000, 60, 'linear')
	-- doTweenX('fog2Run', 'Fog2', -5000, 60, 'linear')
	doTweenY('cameraUp','camGame', -25, 0.15, 'sineInOut')
	doTweenX('treeTransition','treestart',-7500,0.75,'linear')
	-- doTweenColor('darkenBF','boyfriend','8c8c8c',0.1,'linear')
	-- doTweenColor('darkenBFArm','Arm','8c8c8c',0.1,'linear')
	-- doTweenColor('darkenBFBody','Body','8c8c8c',0.1,'linear')
	doTweenColor('darkenDad','dad','8c8c8c',0.1,'linear')
	doTweenColor('darkenDadBody','Jason-Legs','8c8c8c',0.1,'linear')
end

function onUpdate()
-- setProperty('camFollow.x',100)
if cabin then
	doTweenColor('lightenBF','boyfriend','FFFFFF',0.1,'linear')
	doTweenColor('lightenDad','dad','FFFFFF',0.1,'linear')
	if followchars == true then
        if mustHitSection == false then
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
			setPropertyFromClass('GameOverSubstate', 'characterName', 'gf-radio-dead');
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/gfdeath');
	end
end

function onUpdatePost()
	if boyfriendName == 'bf-run' then
		if keyJustPressed('space') then
			triggerEvent('Play Animation', 'dodge', 'BF')
			objectPlayAnimation('Body', 'Dodge', false)
			objectPlayAnimation('Arm', 'Dodge', false)
		end

		if getProperty('Arm.animation.curAnim.name') == 'Dodge' then
			setProperty('Arm.x',getProperty('boyfriend.x') - 150)
			setProperty('Arm.y',getProperty('boyfriend.y') + 75)
		else
			setProperty('Arm.x',getProperty('boyfriend.x') - 75)
			setProperty('Arm.y',getProperty('boyfriend.y') + 150)
		end
	end

	if boyfriendName ~= 'bf-run' then
		removeLuaSprite('Body')
		removeLuaSprite('Arm')
	end

	if dadName ~= 'jason-run' then
		removeLuaSprite('Jason-Body')
	end
	if cabin then
		if not middlescroll then
		-- noteTweenX('noteTweenX0', 0, 732, 0.1, 'linear')
    	-- noteTweenX('noteTweenX1', 1, 844, 0.1, 'linear')
    	-- noteTweenX('noteTweenX2', 2, 956, 0.1, 'linear')
    	-- noteTweenX('noteTweenX3', 3, 1068, 0.1, 'linear')
    	noteTweenX('noteTweenX4', 4, 92, 0.1, 'linear')
    	noteTweenX('noteTweenX5', 5, 204, 0.1, 'linear')
    	noteTweenX('noteTweenX6', 6, 316, 0.1, 'linear')
    	noteTweenX('noteTweenX7', 7, 428, 0.1, 'linear')
		end
		doTweenX('GFX','boyfriend', 600, 0.1, 'linear')
		doTweenY('GFY','boyfriend', 662, 0.1, 'linear')
		doTweenX('PicoX','dad', 1000, 0.1, 'linear')
		doTweenY('PicoY','dad', 1292, 0.1, 'linear')
		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('iconP1.x',P1Mult - 75)
		setProperty('iconP1.origin.x',240)
		setProperty('iconP1.flipX',true)
		setProperty('iconP2.x',P2Mult + 100)
		setProperty('iconP2.origin.x',-100)
		setProperty('iconP2.flipX',true)
		setProperty('healthBar.flipX',true)
	end
end

function onMoveCamera(focus)
	if not cabin then
		if focus == 'boyfriend' then
			triggerEvent('Camera Follow Pos', 1175, 400)
		elseif focus == 'dad' then
			triggerEvent('Camera Follow Pos', 975, 400)
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('radio','beatz')
	end
	
	if bop then
		if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.25 , 0.075)
        else
            triggerEvent("Add Camera Zoom", 0.125 , 0.075)
        end
	end
end

function onTweenCompleted(tag)
	if tag == 'cameraUp' then
		doTweenY('cameraDown','camGame', 0, 0.15, 'sineInOut')
	end

	if tag == 'cameraDown' then
		doTweenY('cameraUp','camGame', -25, 0.15, 'sineInOut')
	end

	if tag == 'grassRun' then
		doTweenX('grassReset', 'grass', -100, 0.01, 'linear')
	end

	if tag == 'grassReset' then
		doTweenX('grassRun', 'grass', -5884, 1, 'linear')
	end

	if tag == 'treeRun' then
		doTweenX('treeReset', 'trees-one', -1000, 0.01, 'linear')
	end

	if tag == 'treeReset' then
		doTweenX('treeRun', 'trees-one', -5138, 1.5, 'linear')
	end

	if tag == 'treeFore1Run' then
		doTweenX('treeFore1Reset', 'treefg-one', 15000, 0.01, 'linear')
	end

	if tag == 'treeFore1Reset' then
		doTweenX('treeFore1Run', 'treefg-one', -15000, 3, 'linear')
	end

	if tag == 'treeFore2Run' then
		doTweenX('treeFore2Reset', 'treefg-two', 75000, 0.01, 'linear')
	end

	if tag == 'treeFore2Reset' then
		doTweenX('treeFore2Run', 'treefg-two', 45000, 3, 'linear')
	end

	if tag == 'treeFore3Run' then
		doTweenX('treeFore3Reset', 'treefg-three', 60000, 0.01, 'linear')
	end

	if tag == 'treeFore3Reset' then
		doTweenX('treeFore3Run', 'treefg-three', -15000, 5, 'linear')
	end

	if tag == 'treeTransition' then
		setProperty('treestart.alpha',0)
	end

	if tag == 'fog1Run' then
		doTweenX('fog1Reset', 'Fog1', 2000, 0.01, 'linear')
	end

	if tag == 'fog1Reset' then
		doTweenX('fog1Run', 'Fog1', -9000, 15, 'linear')
	end

	if tag == 'fog2Run' then
		doTweenX('fog2Reset', 'Fog2', 8000, 0.01, 'linear')
	end

	if tag == 'fog2Reset' then
		doTweenX('fog2Run', 'Fog2', -7000, 15, 'linear')
	end

	if tag == 'foregroundMove' then
		doTweenX('foregroundReset','treefg', 2500, 0.01, 'linear')
		doTweenAlpha('foregroundAlpha','treefg', 0, 0.01, 'linear')
	end

	if name == 'camz' then
    	setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
	end
	-- close(true);
end

function onTimerCompleted(tag)

end

function onGameOver()
	triggerEvent('Camera Follow Pos','','');
	-- setProperty('boyfriend.y',-100)
	-- setProperty('boyfriend.origin.y',100)
	return Function_Continue;
end

function onEvent(name, value1, value2)
	if name == "Tree Foreground" then
		doTweenAlpha('foregroundAlpha','treefg', 1, 0.01, 'linear')
		doTweenX('foregroundMove','treefg', -20000, value1, 'linear')
	end

	if name == "Switch To Radio" then
		triggerEvent('Camera Follow Pos', '', '')
		cancelTween('treeRun')
		cancelTween('treeReset')
		cancelTween('grassRun')
		cancelTween('grassReset')
		cancelTween('treeFore1Run')
		cancelTween('treeFore1Reset')
		cancelTween('treeFore2Run')
		cancelTween('treeFore2Reset')
		cancelTween('treeFore3Run')
		cancelTween('treeFore3Reset')
		-- removeLuaSprite('trees-one')
		-- removeLuaSprite('grass')
		-- removeLuaSprite('treefg-one')
		-- removeLuaSprite('treefg-two')
		-- removeLuaSprite('treefg-three')
		-- removeLuaSprite('blue')
		setProperty('trees-one.alpha',0)
		setProperty('grass.alpha',0)
		setProperty('treefg-one.alpha',0)
		setProperty('treefg-two.alpha',0)
		setProperty('treefg-three.alpha',0)
		setProperty('blue.alpha',0)
		doTweenZoom('camz','camGame',0.6,0.1,'sineInOut')
		cancelTween('cameraUp')
		cancelTween('cameraDown')
		setProperty('health',1)
		-- setPropertyFromClass('GameOverSubstate', 'characterName', 'gf-radio-death');

		cabin = true

		-- makeLuaSprite('cabin-wall', 'stages/cabin/Background', -1000, 0);
		-- setScrollFactor('cabin-wall', 0.5, 0.5);
		-- setProperty('cabin-wall.antialiasing', true);
		-- setObjectOrder('cabin-wall', 1);

		-- makeLuaSprite('cabin-table', 'stages/cabin/Table', 600, 1450);
		-- setScrollFactor('cabin-table', 1, 1);
		-- setProperty('cabin-table.antialiasing', true);
		-- setObjectOrder('cabin-table', 2);

		setProperty('cabin-wall.alpha',1);
		setProperty('cabin-table.alpha',1);
	end

	if name == "Tree Transition" then
		setProperty('treestart.alpha',1)
		setProperty('treestart.x',1500)
		doTweenX('treeEnd','treestart',-2000,0.75,'linear')
	end

	if name == "Note Boppin" then
		-- bop = true
		bop = not bop
	end

	-- close()
end