function onUse(cid, item, fromPosition, itemEx, toPosition)

if itemEx.actionid == 49330 and itemEx. itemid == 354 then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return TRUE
end

if itemEx.uid == 55535 then
	doRemoveItem(itemEx.uid)
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	return TRUE
end

if (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then
	doTransformItem(itemEx.uid, 392)
	doDecayItem(itemEx.uid)
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	return TRUE
end
return FALSE
end