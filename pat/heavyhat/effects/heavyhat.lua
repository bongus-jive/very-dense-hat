function init()
  local entityId = entity.id()
  
  local promise = world.sendEntityMessage(entityId, "pat_heavyhatremove")
  if not promise:result() then
    return effect.expire()
  end

  self.offset = config.getParameter("offset")
  self.direction = mcontroller.facingDirection()

  local pos = mcontroller.position()
  pos[1] = pos[1] - (self.offset[1] * self.direction)
  pos[2] = pos[2] - self.offset[2]

  local params = {}
  if self.direction == -1 then
    params.processing = "?flipx"
  end

  self.hatId = world.spawnProjectile("pat_heavyhat", pos, entityId, {0, 0}, false, params)
end

function update()
  if not self.hatId then
    return effect.expire()
  end

  if not world.entityExists(self.hatId) then
    local modifier = config.getParameter("killModifier")
    effect.addStatModifierGroup(modifier)
    self.hatId = nil
    return
  end

  local hatPos = world.entityPosition(self.hatId)
  hatPos[1] = hatPos[1] + (self.offset[1] * self.direction)
  hatPos[2] = hatPos[2] + self.offset[2]
  mcontroller.setPosition(hatPos)
  mcontroller.controlFace(self.direction)

  effect.modifyDuration(1)
end
