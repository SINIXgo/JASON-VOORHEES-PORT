-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '-13'}
downoffsets = {'0', '-10'}
upoffsets = {'2', '19'}
rightoffsets = {'0', '8'}

leftMissoffsets = {'0', '68'}  -- you probably won't need these if it's for the opponent
downMissoffsets = {'0', '75'}  --
upMissoffsets = {'1', '90'}    --
rightMissoffsets = {'1', '69'} --

-- alt animations, you don't need these if you're not gonna use them
leftAltoffsets = {'0', '0'}
downAltoffsets = {'0', '0'}
upAltoffsets = {'0', '0'}
rightAltoffsets = {'0', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'GF idle dance'
left_xml_name = 'GF LEFT NOTE'
down_xml_name = 'GF DOWN NOTE'
up_xml_name = 'GF UP NOTE'
right_xml_name = 'GF RIGHT NOTE'

left_miss_xml_name = 'GF LEFT MISS'   -- you probably won't need these if it's for the opponent
down_miss_xml_name = 'GF DOWN MISS'   --
up_miss_xml_name = 'GF UP MISS'       --
right_miss_xml_name = 'GF RIGHT MISS' --

left_alt_xml_name = 'left alt'
down_alt_xml_name = 'down alt'
up_alt_xml_name = 'up alt'
right_alt_xml_name = 'right alt'

-- basically horizontal and vertical positions
x_position = 1050
y_position = 450

-- scales your character (set to 1 by default)
xScale = 1
yScale = 1

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'GF_head_run'
name_of_character = 'gf-run'
name_of_notetype = 'GF Notes'
name_of_notetype2 = 'BFGF Notes' -- for multiple characters singing at the same time
--altnotetype = '' -- this is used for alt animations (uncomment if you use them)
--altnotetype2 = '' -- this is used for alt animations and singing at the same time (uncomment if you use them)

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = true -- change to 'true' if you want to flipX


doIdle = true


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

	makeLuaSprite('trees-one', 'stages/forest/Forest_1_long', -1000, -750);
	-- scaleObject('trees-one', 1.25, 1.25);
	setScrollFactor('trees-one', 0.75, 0.75);
	setProperty('trees-one.antialiasing', true);
	setObjectOrder('trees-one', 0);

	makeLuaSprite('grass', 'stages/forest/Grass_long_alt', -100, 600);
	scaleObject('grass', 1.25, 1.25);
	setScrollFactor('grass', 1, 1);
	setProperty('grass.antialiasing', true);
	setObjectOrder('grass', 1);

	if boyfriendName == 'bf-run' or boyfriendName == 'bf-corner' then

		    makeAnimatedLuaSprite('gfHair','characters/GF_hair_blowing', 0, 0)
    		addAnimationByPrefix('gfHair', 'idle', 'gf hair blowing', 24, true)
    		objectPlayAnimation('gfHair','idle')
    -- addLuaSprite('gfHair',true)
    		setObjectOrder('gfHair', 9);
	end

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
		addAnimationByPrefix('Arm', 'Run', 'Arms BF Idle', 24, true);
		setScrollFactor('Arm', 1.05, 1.05);
		setProperty('Arm.antialiasing', true);
		setObjectOrder('Arm', 10);
	elseif boyfriendName == 'bf-corner' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'chase-death');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/chasedeath'); 
		makeAnimatedLuaSprite('Body', 'characters/BF_runbody', 0, 0);
		-- scaleObject('Body', 1, 1);
		addAnimationByPrefix('Body', 'Run', 'BF BODY', 24, true);
		objectPlayAnimation('Body','Run')
		setScrollFactor('Body', 1.05, 1.05);
		setProperty('Body.antialiasing', true);
		-- addLuaSprite('Body', false)
		setObjectOrder('Body', 3);

		makeAnimatedLuaSprite('Arm', 'characters/Arms', 0, 0);
		-- scaleObject('Body', 1, 1);
		addAnimationByPrefix('Arm', 'Run', 'Arms', 24, true);
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

-- Will change that
if boyfriendName == 'bf-run' or boyfriendName == 'bf-corner' then
    		makeAnimatedLuaSprite('gfBody','characters/GF_body', 0, 0)
    		addAnimationByPrefix('gfBody', 'idle', 'GF idle dance Body', 24, true)
    		objectPlayAnimation('gfBody','idle')
    -- addLuaSprite('gfBody',true)
    		setObjectOrder('gfBody', 76);


	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);
    setScrollFactor(name_of_character, 0.9, 0.9)
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, true);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHT-alt', right_alt_xml_name, 24, false);

	-- if playablecharacter == true then
	-- 	-- setPropertyLuaSprite(name_of_character, 'flipX', true);
	-- else
	-- 	-- setPropertyLuaSprite(name_of_character, 'flipX', false);
	-- end

	scaleObject(name_of_character, xScale, yScale);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end
		makeLuaSprite('treefg-one', 'stages/forest/Forest_2', 15000, -750);
		scaleObject('treefg-one', 1.25, 1.25);
		setScrollFactor('treefg-one', 0, 0);
		setProperty('treefg-one.antialiasing', true);
		setObjectOrder('treefg-one', 97);

		makeLuaSprite('treefg-two', 'stages/forest/Forest_BG_2', 75000, -300);
		scaleObject('treefg-two', 1.25, 1.25);
		setScrollFactor('treefg-two', 0, 0);
		setProperty('treefg-two.antialiasing', true);
		setObjectOrder('treefg-two', 98);

		makeLuaSprite('treefg-three', 'stages/forest/Forest_2', 60000, -750);
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
		setProperty('gfBody.x',getProperty('boyfriend.x')-325)
    	setProperty('gfBody.y',getProperty('boyfriend.y')+150)
    	setProperty('gfHair.x',getProperty('gfBody.x')-180)
    	setProperty('gfHair.y',getProperty('gfBody.y')-165)
	end

	if boyfriendName == 'bf-corner' then
		setProperty('Body.x',getProperty('boyfriend.x') - 130)
		setProperty('Body.y',getProperty('boyfriend.y') + 160)
		setProperty('Arm.x',getProperty('boyfriend.x') - 187.5)
		setProperty('Arm.y',getProperty('boyfriend.y') + 155)
		setProperty('gfBody.x',getProperty('boyfriend.x')-375)
    	setProperty('gfBody.y',getProperty('boyfriend.y')+160)
    	setProperty('gfHair.x',getProperty('gfBody.x')-180)
    	setProperty('gfHair.y',getProperty('gfBody.y')-145)
	end

	if dadName == 'jason-run' then
		setProperty('Jason-Body.x',getProperty('dad.x')-20)
		setProperty('Jason-Body.y',getProperty('dad.y')+300)
	end

    removeLuaScript("custom_events/zCameraFix")
    addLuaScript("custom_events/zCameraFix")
end

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
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end

function onUpdate()
-- setProperty('camFollow.x',100)
if cabin then
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

-- Have to use an and in this case
	if boyfriendName ~= 'bf-run' and boyfriendName ~= 'bf-corner' then
		removeLuaSprite('Body')
		removeLuaSprite('Arm')
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
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

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        doIdle = false
        objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        end
    end
end

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}
function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == name_of_notetype or noteType == name_of_notetype2 then
        doIdle = false
        objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', downMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        end
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
		-- objectPlayAnimation('radio','beatz')
		-- objectPlayAnimation(name_of_character, 'idle')
	end
	
	if bop then
		if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.25 , 0.075)
        else
            triggerEvent("Add Camera Zoom", 0.125 , 0.075)
        end
	end

	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
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
		removeLuaSprite('trees-one')
		removeLuaSprite('grass')
		removeLuaSprite('treefg-one')
		removeLuaSprite('treefg-two')
		removeLuaSprite('treefg-three')
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