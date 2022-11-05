function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bars' then --Check if the note on the chart is a Bullet Note
			-- setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Bullet_Note'); --Change notetexture
			-- setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.375');
			-- --setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			-- --setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			-- --setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes

			-- if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			-- 	setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			-- end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bars' then
		if direction == 0 then
			triggerEvent('Play Animation','singLEFT-alt','BF')
		end 
		if direction == 1 then
			triggerEvent('Play Animation','singDOWN-alt','BF')
		end 
		if direction == 2 then
			triggerEvent('Play Animation','singUP-alt','BF')
		end 
		if direction == 3 then
			triggerEvent('Play Animation','singRIGHT-alt','BF')
		end 
	end
end