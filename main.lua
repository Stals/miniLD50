require "player"
require "enemy"

enemies = {}

settings = {}
settings.enemySpawnTime = 1
settings.spawnTimeElapsed = 0

function love.load()
	player.load()

	table.insert(enemies, newEnemy(love.graphics.getWidth() / 4, 100))
	table.insert(enemies, newEnemy(love.graphics.getWidth() / 2, 100))
	table.insert(enemies, newEnemy(love.graphics.getWidth() * (3 / 4), 100))
end

function love.update(dt)
	settings.spawnTimeElapsed = settings.spawnTimeElapsed + dt

	player.update(dt)
	updateEnemies(dt)

	if(settings.spawnTimeElapsed >= settings.enemySpawnTime) then
		settings.spawnTimeElapsed = 0
		spawnRandomEnemy()
	end
end

function love.draw()
	player.draw(dt)
	drawEnemies()
end


function updateEnemies(dt)
	len = table.getn(enemies)

	 for i = 1, len do
		updateEnemy(enemies[i], dt)
	end
end

function drawEnemies()
	len = table.getn(enemies)

	 for i = 1, len do
		drawEnemy(enemies[i])
	end
end

function spawnRandomEnemy()
	local side = math.random(0, 4)
	local x = 0
	local y = 0

	-- left
	if side == 0 then
		x = - 25
		y = math.random(0, love.graphics.getHeight())

	-- right
	elseif side == 1 then
		x =  love.graphics.getWidth() + 25
		y = math.random(0, love.graphics.getHeight())

	-- down
	elseif side == 2 then
		x =  math.random(0, love.graphics.getWidth())
		y =  love.graphics.getHeight() + 25
	-- up
	elseif side == 3 then
		x =  math.random(0, love.graphics.getWidth())
		y =  -25
	end

	table.insert(enemies, newEnemy(x, y))
end


