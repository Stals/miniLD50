require "player"

function newEnemy(x, y)
    local enemyInstance = {}

	enemyInstance.x = x
	enemyInstance.y = y

	enemyInstance.width = 20
	enemyInstance.height = 20
	enemyInstance.speed = 125

    return enemyInstance
end

function drawEnemy(self)
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function updateEnemy(self, dt)
	-- set vector to player
	vec = {x = player.x - self.x, y = player.y - self.y}
	len = math.sqrt(vec.x * vec.x + vec.y * vec.y)
	vec.x = vec.x / len
	vec.y = vec.y / len

	-- move enemy
	self.x = self.x + vec.x * self.speed * dt
	self.y = self.y + vec.y * self.speed * dt
end