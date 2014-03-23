require "player"

function newEnemy(x, y)
    local enemyInstance = {}

	enemyInstance.x = x
	enemyInstance.y = y

	enemyInstance.radius = 10
	enemyInstance.speed = 125

    return enemyInstance
end

function drawEnemy(self)
	love.graphics.setColor(0, 0, 255)
	--love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
	love.graphics.circle( "fill", self.x, self.y, self.radius, 10)
end

function updateEnemy(self, dt)
	-- set vector to player
	local vec = getPlayerVector(self)

	-- move enemy
	self.x = self.x + vec.x * self.speed * dt
	self.y = self.y + vec.y * self.speed * dt
end

function getPlayerVector(self)
	local vec = {x = player.x - self.x, y = player.y - self.y}
	len = math.sqrt(vec.x * vec.x + vec.y * vec.y)
	vec.x = vec.x / len
	vec.y = vec.y / len
	return vec
end
