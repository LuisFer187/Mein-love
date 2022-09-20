Bullets = {}
Bullets.__index = Bullets
require("classes.Bullet")

function Bullets:create()
    local self = {}             
    setmetatable(self,Bullet)
    self.list = {}
    return self
end

function Bullets:spawn(x,y)
    local i = Bullet:create(x, y, 10)
    table.insert(self.list, i)
end

function Bullets:draw()
    for i, v in ipairs(self.list) do
        love.graphics.circle("fill",v.x,v.y,v.r)
    end
end

function Bullets:update(dt)
    for i, v in ipairs(self.list) do
        v:update(dt)
    end
end