Bullet = {}
Bullet.__index = Bullet

function Bullet:create(x, y,ph,pw)
    local self = {}             
    setmetatable(self,Bullet)
    self.x = x+(pw/2)
    self.y = y+(ph*2)
    self.vel = 500
    local mx, my = love.mouse.getPosition()
    local mag = math.sqrt(math.pow(mx-self.x,2)+math.pow(my-self.y,2))
    self.dirx = (mx-self.x)/mag
    self.diry = (my-self.y)/mag
    self.r = 3
    return self
end

function Bullet:update(dt)
    self.y=self.y+self.diry*self.vel*dt
    self.x=self.x+self.dirx*self.vel*dt
end