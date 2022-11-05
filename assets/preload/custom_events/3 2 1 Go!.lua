local time;

function onEvent(name, value1, value2)
    if name == "3 2 1 Go!" then
        time = value1;
        runTimer("3",time)
    end
end

function onTimerCompleted(tag)
    if tag == "3" then
        makeLuaSprite('ready','ready',0,0)
        setObjectCamera('ready','other')
        screenCenter('ready')
        addLuaSprite('ready')
        doTweenAlpha('readyFade','ready',0,time,'linear')
        runTimer("2",time)
    end

    if tag == "2" then
        makeLuaSprite('set','set',0,0)
        setObjectCamera('set','other')
        screenCenter('set')
        addLuaSprite('set')
        doTweenAlpha('setFade','set',0,time,'linear')
        runTimer("1",time)
    end

    if tag == "1" then
        makeLuaSprite('go','go',0,0)
        setObjectCamera('go','other')
        screenCenter('go')
        addLuaSprite('go')
        doTweenAlpha('goFade','go',0,time,'linear')
    end
end
