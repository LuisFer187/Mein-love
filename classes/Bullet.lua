Bullet = {}
Bullet.__index = Bullet

function Bullet:create(x, y, r)
    local self = {}             
    setmetatable(self,Bullet)
    self.x = x
    self.y = y
    self.vel = 1
    --local mx, my = love.mouse.getPosition()
    --local unit = math.sqrt(math.pow((mx-self.x),2)+math.pow((my-self.y),2))
    --self.speedx= ((mx-self.x)/unit)*self.vel
    --self.speedy= ((my-self.y)/unit)*self.vel
    self.speedy = 1
    self.speedx = 1
    self.r = r
    return self
end

function Bullet:update(dt)
    self.y=self.y+1
    self.x=self.x+1
end