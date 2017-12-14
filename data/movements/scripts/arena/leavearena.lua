function onStepIn(cid, item, pos, fromPosition)
	if getPlayerStorageValue(cid, 42308) < 1 then
		for i = 42300, 42308 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	-- if he did not make full arena 2 he must start from zero
	if getPlayerStorageValue(cid, 42318) < 1 then
		for i = 42310, 42318 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	-- if he did not make full arena 3 he must start from zero
	if getPlayerStorageValue(cid, 42328) < 1 then
		for i = 42320, 42328 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	if getPlayerStorageValue(cid, 42355) == -1 then
		setPlayerStorageValue(cid,42111, -1)
	end
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,'You have left the arena!')
	doTeleportThing(cid, arenaKickPosition, TRUE)
	setGlobalStorageValue(item.actionid-21, 0) -- free room
	setPlayerStorageValue(cid, 42350, os.time()+5) -- time to kick 0
	setPlayerStorageValue(cid, 42352, 0) -- is not in arena
	setPlayerStorageValue(cid, 42309, 0) -- reset final boss kill
	setPlayerStorageValue(cid, 42319, 0) -- reset final boss kill
	setPlayerStorageValue(cid, 42329, 0) -- reset final boss kill
	return TRUE
end
