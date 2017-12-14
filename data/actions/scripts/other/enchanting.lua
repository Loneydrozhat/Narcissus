local config = {
	hardcoreManaSpent = getConfigValue("addManaSpentInPvPZone"),
	manaCost = 300,
	soulCost = 2,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local iCount = item.type

	if(item.itemid == 2147 and itemEx.itemid == 2342) then
		doTransformItem(itemEx.uid, 2343)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end
	
	local manaCost = config.manaCost * iCount
	local soulCost = config.soulCost * iCount

	if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, 9933)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(isInArray(enchantableGems, item.itemid)) then
		local subtype = item.type
		if(subtype == 0) then
			subtype = 1
		end

		if(getPlayerMana(cid) < manaCost) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
			return true
		end

		if(getPlayerSoul(cid) < soulCost) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
			return true
		end

		local a = table.find(enchantableGems, item.itemid)
		if(a == nil or not isInArray(enchantingAltars[a], itemEx.itemid)) then
			return false
		end

		doPlayerAddMana(cid, -manaCost)
		doPlayerAddSoul(cid, -soulCost)

		doTransformItem(item.uid, enchantedGems[a])
		if(not getPlayerFlagValue(cid, PlayerFlag_NotGainMana) and (not getTileInfo(getThingPosition(cid)).hardcore or config.hardcoreManaSpent)) then
			doPlayerAddSpentMana(cid, manaCost)
		end

		doSendMagicEffect(fromPosition, CONST_ME_HOLYDAMAGE)
		return true
	end
 
	if(isInArray(enchantedGems, item.itemid)) then
		if(not isInArray(enchantableItems, itemEx.itemid)) then
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			return false
		end

		local b = table.find(enchantedGems, item.itemid)
		if(b == nil) then
			return false
		end

		local subtype = itemEx.type
		if(not isInArray({2544, 8905}, itemEx.itemid)) then
			subtype = 1000
		end

		doTransformItem(itemEx.uid, enchantedItems[itemEx.itemid][b], subtype)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HOLYDAMAGE)
		doDecayItem(itemEx.uid)

		doRemoveItem(item.uid, 1)
		return true
	end

	return false
end
