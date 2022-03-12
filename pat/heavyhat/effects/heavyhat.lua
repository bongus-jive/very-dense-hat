function init()
	local p = {}
	if mcontroller.facingDirection() == -1 then
		p.processing = "?flipx"
	end
	hatId = world.spawnProjectile("pat_heavyhat", mcontroller.position(), entity.id(), {0, 0}, false, p)
	
	world.sendEntityMessage(entity.id(), "pat_heavyhatremove")
end

function update(dt)
	if hatId then
		if world.entityExists(hatId) then
			local hatPos = world.entityPosition(hatId)
			hatPos[2] = hatPos[2] - 0.125
			mcontroller.setPosition(hatPos)
			effect.modifyDuration(1)
		else
			effect.addStatModifierGroup({{stat = "maxHealth", effectiveMultiplier = 0}})
		end
	else
		effect.expire()
	end
end
