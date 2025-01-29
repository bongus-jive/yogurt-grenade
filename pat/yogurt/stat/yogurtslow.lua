function init()
  animator.setParticleEmitterOffsetRegion("drips", mcontroller.boundBox())

  local get = config.getParameter
  effect.setParentDirectives(get("directives"))
  effect.addStatModifierGroup(get("statModifiers"))
  self.controlModifiers = get("controlModifiers")
end

function update()
  mcontroller.controlModifiers(self.controlModifiers)
end
