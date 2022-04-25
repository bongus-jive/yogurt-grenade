function init()
  animator.setParticleEmitterOffsetRegion("drips", mcontroller.boundBox())
  animator.setParticleEmitterActive("drips", true)
  effect.setParentDirectives("fade=EABAE2=0.8")
  effect.addStatModifierGroup({
    {stat = "jumpModifier", amount = -0.2}
  })
end

function update(dt)
  mcontroller.controlModifiers({
		groundMovementModifier = 0.5,
		speedModifier = 0.65,
		airJumpModifier = 0.80
	})
end