function onCreate()
	makeLuaSprite('skyblue', 'stages/jasonnerd/skyblue', -54, -382);
	scaleObject('skyblue', 2, 2);
	setScrollFactor('skyblue', 1.25, 1.25);
	setProperty('skyblue.antialiasing', true);
	setObjectOrder('skyblue', 0);

	makeLuaSprite('Mountain_2', 'stages/jasonnerd/Mountain_2', 813, 107);
	scaleObject('Mountain_2', 1, 1);
	setScrollFactor('Mountain_2', 1.25, 1.25);
	setProperty('Mountain_2.antialiasing', true);
	setObjectOrder('Mountain_2', 1);

	makeLuaSprite('Mountain', 'stages/jasonnerd/Mountain', -362, -193);
	scaleObject('Mountain', 1, 1);
	setScrollFactor('Mountain', 1.2, 1.2);
	setProperty('Mountain.antialiasing', true);
	setObjectOrder('Mountain', 2);

	makeLuaSprite('Trees', 'stages/jasonnerd/Trees', -373, 280);
	scaleObject('Trees', 1, 1);
	setScrollFactor('Trees', 1.1, 1.1);
	setProperty('Trees.antialiasing', true);
	setObjectOrder('Trees', 3);

	makeAnimatedLuaSprite('Cabin', 'stages/jasonnerd/Cabin', 152, 345);
	scaleObject('Cabin', 1, 1);
	addAnimationByPrefix('Cabin', 'Cabin', 'Cabin', 24, false);
	setScrollFactor('Cabin', 1.05, 1.05);
	setProperty('Cabin.antialiasing', true);
	setObjectOrder('Cabin', 4);

	makeAnimatedLuaSprite('BridgeZone', 'stages/jasonnerd/BridgeZone', -395, 605);
	scaleObject('BridgeZone', 1, 1);
	addAnimationByPrefix('BridgeZone', 'Bridge', 'Bridge', 24, false);
	setScrollFactor('BridgeZone', 1, 1);
	setProperty('BridgeZone.antialiasing', true);
	setObjectOrder('BridgeZone', 5);

	makeAnimatedLuaSprite('Gos_and_JJ', 'stages/jasonnerd/Gos_and_JJ', 288, 297);
	scaleObject('Gos_and_JJ', 1, 1);
	addAnimationByPrefix('Gos_and_JJ', 'Gos and JJ', 'Gos and JJ', 24, false);
	setScrollFactor('Gos_and_JJ', 1, 1);
	setProperty('Gos_and_JJ.antialiasing', true);
	setObjectOrder('Gos_and_JJ', 6);

	makeAnimatedLuaSprite('Lucio', 'stages/jasonnerd/Lucio', 1588, 1018);
	scaleObject('Lucio', 1, 1);
	addAnimationByPrefix('Lucio', 'Lucio', 'Lucio', 20, false);
	setScrollFactor('Lucio', 1, 1);
	setProperty('Lucio.antialiasing', true);
	setObjectOrder('Lucio', 7);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 8);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 9);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 10);

	makeLuaSprite('Tree', 'stages/jasonnerd/Tree', 1450, -560);
	scaleObject('Tree', 1, 1);
	setScrollFactor('Tree', 1, 1);
	setProperty('Tree.antialiasing', true);
	setObjectOrder('Tree', 11);

	makeAnimatedLuaSprite('Frank_and_bluer', 'stages/jasonnerd/Frank_and_bluer', 282, 771);
	scaleObject('Frank_and_bluer', 1, 1);
	addAnimationByPrefix('Frank_and_bluer', 'Frank and Bluer', 'Frank and Bluer', 24, false);
	setScrollFactor('Frank_and_bluer', 1, 1);
	setProperty('Frank_and_bluer.antialiasing', true);
	setObjectOrder('Frank_and_bluer', 12);

	-- close(true);
end

function onCountdownTick(counter)
	if counter == 2 then
		objectPlayAnimation('Cabin','Cabin')
		objectPlayAnimation('BridgeZone','Bridge')
		objectPlayAnimation('Gos_and_JJ','Gos and JJ')
		objectPlayAnimation('Lucio','Lucio')
		objectPlayAnimation('Frank_and_bluer','Franke and Bluer')
	end
end

function onSongStart()
	objectPlayAnimation('Cabin','Cabin')
	objectPlayAnimation('BridgeZone','Bridge')
	objectPlayAnimation('Gos_and_JJ','Gos and JJ')
	objectPlayAnimation('Lucio','Lucio')
	objectPlayAnimation('Frank_and_bluer','Franke and Bluer')
end

function onBeatHit()
	-- debugPrint(curBeat)
	if curBeat % 2 == 0 then
		objectPlayAnimation('Cabin','Cabin')
		objectPlayAnimation('BridgeZone','Bridge')
		objectPlayAnimation('Gos_and_JJ','Gos and JJ')
		objectPlayAnimation('Lucio','Lucio')
		objectPlayAnimation('Frank_and_bluer','Franke and Bluer')
	end

	-- close(true);
end

function onTweenCompleted(tag)
	-- close(true);
end