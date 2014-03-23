
function newBullet(x, y, vec)
    local bulletInstance = {}

	bulletInstance.x = x
	bulletInstance.y = y
	bulletInstance.vec = vec

	bulletInstance.width = 3
	bulletInstance.height = 3
	bulletInstance.speed = 300

    return bulletInstance
end

function drawBullet(self)
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function updateBullet(self, dt)
	self.x = self.x + self.vec.x * self.speed * dt
	self.y = self.y + self.vec.y * self.speed * dt
end