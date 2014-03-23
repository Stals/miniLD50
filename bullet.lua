
bullet = {}
bullet.x = 0
bullet.y = 0
bullet.width = 3
bullet.height = 3
bullet.speed = 450
bullet.vec = {}

function bullet.spawn(x, y, vec)
	bullet.x = x
	bullet.y = y
	bullet.vec = vec

	return bullet
end

function bullet.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', bullet.x, bullet.y, bullet.width, bullet.height)
end

function bullet.update(dt)
	bullet.x = bullet.x + bullet.vec.x * bullet.speed * dt
	bullet.y = bullet.y + bullet.vec.y * bullet.speed * dt
end