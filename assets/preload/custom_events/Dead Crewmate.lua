function onEvent(name, value1, value2)
    if name == 'Dead Crewmate' then
        makeAnimatedLuaSprite('deadCrewmate', 'stages/amongus/members/Crewmane_dead',defaultOpponentX + 412.5,defaultOpponentY + 562.5)
	    addAnimationByPrefix('deadCrewmate','dead', 'Crewmane body')
	    addLuaSprite('deadCrewmate', true)
    end
end
