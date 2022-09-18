Bullet = {}
Bullet.__index = Bullet

function Bullet:create(x, y, r)
    local self = {}             
    setmetatable(self,Bullet)
    self.x = x
    self.y = y
    self.vel = 1
    local mx, my = love.mouse.getPosition()
    local unit = math.sqrt(math.pow(mx-self.x,2)+math.pow(my-self.y,2))
    self.speedx= ((mx-self.x)/unit)*self.vel
    self.speedy= ((my-self.y)/unit)*self.vel
    self.r = r
    return self
end

function Bullet:update(dt)
    self.x=self.x+self.speedx*dt
    self.y=self.y+self.speedy*dt
end

function Bullet:draw()
    love.graphics.circle("fill",self.x,self.y,self.r)
end