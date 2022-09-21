Bullets = {}
Bullets.__index = Bullets
require("classes.Bullet")

function Bullets:create()
    local self = {}             
    setmetatable(self,Bullets)
    self.list = {}
    return self
end

function Bullets:spawn(x,y,ph,pw)
    table.insert(self.list, Bullet:create(x, y,ph,pw))
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