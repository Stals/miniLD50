require "player"
require "enemy"

enemies = {}

function love.load()
	player.load()

	table.insert(enemies, newEnemy(love.graphics.getWidth() / 4, 100))
	table.insert(enemies, newEnemy(love.graphics.getWidth() / 2, 100))
	table.insert(enemies, newEnemy(love.graphics.getWidth() * (3 / 4), 100))
end

function love.update(dt)
	player.update(dt)
	updateEnemies(dt)
end

function love.draw()
	player.draw(dt)
	drawEnemies()
end


function updateEnemies(dt)
	len = table.getn(enemies)

	 for i=1, len do
		updateEnemy(enemies[i], dt)
	end
end

function drawEnemies()
	len = table.getn(enemies)

	 for i=1, len do
		drawEnemy(enemies[i])
	end
end
