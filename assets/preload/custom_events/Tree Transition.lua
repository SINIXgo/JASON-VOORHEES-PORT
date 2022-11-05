function onCreate()
	precacheImage('mods/images/stages/forest/Trees_Foreground')
end

function onEvent(name, value1, value2)
	if name == "Tree Transition" then
		-- makeLuaSprite('treeend', 'stages/forest/Forest_Transition', -2000, 1500);
		-- scaleObject('treeend', 1.5, 1.5);
		-- setScrollFactor('treeend', 0, 0);
		-- setProperty('treeend.antialiasing', true);
		-- setObjectOrder('treeend', 101);
		-- addLuaSprite('treeend',true)
		-- doTweenX('treeEnd','treeend',-2000,0.75,'linear')
	end
end

function onTweenCompleted(tag)

end