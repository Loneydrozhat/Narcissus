local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -30, -1, -40, 5, 20, 2.4, 2.1)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
