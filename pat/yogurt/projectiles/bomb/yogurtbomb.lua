function init()
  local rot = config.getParameter("rotationSpeed")
  if type(rot) == "table" then
    self.rotationSpeed = sb.nrand(rot.standardDeviation, rot.mean or 20)
  else
    self.rotationSpeed = rot
  end
end

function update(dt)
  local vel = mcontroller.velocity()
  local dir = vel[1] > 0 and -1 or 1
  local mag = math.sqrt(vel[1] * vel[1] + vel[2] * vel[2])
  local rot = (mag / 180 * math.pi) * dir * dt * self.rotationSpeed
  mcontroller.setRotation(mcontroller.rotation() + rot)
end

function destroy()
  local liq = config.getParameter("liquidOnDestroy")
  if not liq then return end

  local id = liq.id or root.liquidId(liq.name)
  world.spawnLiquid(mcontroller.position(), id, liq.quantity)
end
