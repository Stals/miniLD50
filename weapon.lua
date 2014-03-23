require "bullet"

weapon = {}
weapon.cooldown = 0.1  --in seconds
weapon.canShoot = true
weapon.timeElapsed = 0

function weapon.draw()
	for i,v in ipairs(bullet) do
		v.b.draw()
	end
end

function weapon.update(dt)
	if not weapon.canShoot then
		weapon.timeElapsed = weapon.timeElapsed + dt
		if weapon.timeElapsed >= weapon.cooldown then
			weapon.canShoot = true
		end
	end

	-- update bullets
	for i,v in ipairs(bullet) do
		v.b.update(dt)
	end
end

function weapon.shoot(x, y, vec)
	if weapon.canShoot then
		weapon.canShoot = false
		weapon.timeElapsed = 0

		bul = bullet.spawn(x, y, vec)
		table.insert(bul, {b=bul})
	end
end