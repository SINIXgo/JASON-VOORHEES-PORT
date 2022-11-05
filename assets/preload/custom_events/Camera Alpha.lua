local game = {}
local hud = {}

function onEvent(name, value1, value2)
	if name == "Camera Alpha" then
		for i in string.gmatch(value1, '([^,]+)') do
			table.insert(game,i)
		end

		for i in string.gmatch(value2, '([^,]+)') do
			table.insert(hud,i)
		end

		if value1 ~= '' then
			if game[1] ~= nil then
				function checkX()
   					return tonumber(game[1])
				end
				v, massage = pcall(checkX)

				if v then
					game[1] = tonumber(game[1])
				else
					game[1] = getProperty('camGame.alpha')
				end
			else
				game[1] = getProperty('camGame.alpha')
			end

			if game[2] ~= nil then
				function checkX()
   					return tonumber(game[2])
				end
				v, massage = pcall(checkX)

				if v then
					game[2] = tonumber(game[2])
				else
					game[2] = 1
				end
			else
				game[2] = 1
			end
		else
			game[1] = getProperty('camGame.alpha')
			game[2] = 1
		end

		if value2 ~= '' then
			-- debugPrint('This has stuff')
			if hud[1] ~= nil then
				function checkX()
   					return tonumber(hud[1])
				end
				v, massage = pcall(checkX)
				
				if v then
					hud[1] = tonumber(hud[1])
				else
					hud[1] = getProperty('camHUD.alpha')
				end
			end

			if hud[2] ~= nil then
				function checkX()
   					return tonumber(hud[2])
				end
				v, massage = pcall(checkX)

				if v then
					hud[2] = tonumber(hud[2])
				else
					hud[2] = 1
				end
			else
				hud[2] = 1
			end
		else
			hud[1] = getProperty('camHUD.alpha')
			hud[2] = 1
		end

		doTweenAlpha('gameAlpha','camGame', game[1], game[2], 'linear')
		doTweenAlpha('hudAlpha','camHUD', hud[1], hud[2], 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'gameAlpha' then
		game = {}
	end

	if tag == 'hudAlpha' then
		hud = {}
	end
end