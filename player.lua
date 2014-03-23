require "weapon"

player = {}

function player.load()
	player.width = 20
	player.height = 20
	player.x = love.graphics.getWidth() / 2 - (player.width / 2)
	player.y = love.graphics.getHeight() * (3 / 4) - (player.height / 2)
	player.speed = 250 --pixels per second
end

function player.update(dt)
	player.move(dt)
	player.shoot(dt)

	weapon.update(dt)
end

function player.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

	weapon.draw()
end

function player.move(dt)
	if love.keyboard.isDown('d') then
		player.x = player.x + player.speed * dt
	end

	if love.keyboard.isDown('a') then
		player.x = player.x - player.speed * dt
	end

	if love.keyboard.isDown('w') then
		player.y = player.y - player.speed * dt
	end

	if love.keyboard.isDown('s') then
		player.y = player.y + player.speed * dt
	end

end

function player.shoot(dt)

	vec = {x = 0, y = 0}
	if love.keyboard.isDown('up') then
		vec.y = -1
	end

	if love.keyboard.isDown('down') then
		vec.y = 1
	end

	if love.keyboard.isDown('left') then
		vec.x = -1
	end

	if love.keyboard.isDown('right') then
		vec.x = 1
	end

	if vec.x ~= 0 or vec.y ~= 0 then
		weapon.shoot(player.x + player.width/2, player.y + player.height/2, vec)
	end
end
