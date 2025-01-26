function init()
  self.rotationSpeed = config.getParameter("rotationSpeed", 20)
end

function update(dt)
  local vel = mcontroller.velocity()
  local dir = vel[1] > 0 and -1 or 1
  local mag = math.sqrt(vel[1] * vel[1] + vel[2] * vel[2])
  local rot = (mag / 180 * math.pi) * dir * dt * self.rotationSpeed
  mcontroller.setRotation(mcontroller.rotation() + rot)
end
