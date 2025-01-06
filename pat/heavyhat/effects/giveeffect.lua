function init()
  self.timer = 0.4
end

function update(dt)
  if self.timer > 0 then
    self.timer = self.timer - dt
    return
  end

  status.addEphemeralEffect("pat_heavyhat")
end
