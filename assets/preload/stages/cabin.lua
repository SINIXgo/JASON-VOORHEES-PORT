bop = false

function onCreate()
	-- background shit
	makeLuaSprite('cabin-bg','stages/cabin/Cabin_on', -1000, -500)
	-- scaleObject('cabin-bg', 0.875, 0.875);
	addLuaSprite('cabin-bg')

	makeAnimatedLuaSprite('radio', 'stages/cabin/Radio_Beat_assets',540,600)
	addAnimationByPrefix('radio','beatz', 'Radio beat Luz', 24, false)
	addLuaSprite('radio',true)

	makeAnimatedLuaSprite('fireplace', 'stages/cabin/Fireplace_on',-950,-875)
	-- scaleObject('fireplace', 0.875, 0.875);
	addAnimationByPrefix('fireplace','burning', 'Fireplace on')
	objectPlayAnimation('fireplace','burning')
	addLuaSprite('fireplace')


	-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCountdownTick(counter)
	if counter == 0 then
		objectPlayAnimation('radio','beatz')
	end

	if counter == 2 then
		objectPlayAnimation('radio','beatz')
	end
end

function onSongStart()
	objectPlayAnimation('radio','beatz')
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('radio','beatz')
	end
	
	if bop then
		if curBeat % 2 == 0 then
            triggerEvent("Add Camera Zoom", 0.125 , 0.075)
        else
            triggerEvent("Add Camera Zoom", 0.05 , 0.075)
        end
	end
end

function onEvent(name,value1,value2)
	if name == "Note Boppin" then
		-- bop = true
		bop = not bop
	end
end