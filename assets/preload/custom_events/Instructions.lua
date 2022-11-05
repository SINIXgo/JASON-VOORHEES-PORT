time = 1;

function onEvent(name, value1, value2)
    if name == 'Instructions' then
        makeLuaText('instructions',value1, '', 0,0)
        setTextAlignment('instructions', 'center')
        setObjectCamera('instructions','camOther')
        setTextSize('instructions',42)
        screenCenter('instructions')
        setProperty('instructions.alpha',0)
        addLuaText('instructions')
        if value2 ~= nil then
            time = tonumber(value2);
        end
        doTweenAlpha('instructionsFadeIn', 'instructions', 1, 0.5, 'sineInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'instructionsFadeIn' then
        runTimer('delay', time)
    end

    if tag == 'instructionsFadeOut' then
        removeLuaText('instructions')
    end
end

function onTimerCompleted(tag)
    if tag == 'delay' then
        doTweenAlpha('instructionsFadeOut', 'instructions', 0, 0.5, 'sineInOut')
    end
end
