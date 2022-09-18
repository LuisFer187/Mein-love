Player = {}
Player.__index = Player

local anim8 = require("lib.anim8")

function Player:create(x, y, h, w, name)
   local self = {}             -- our new object
   setmetatable(self,Player)  -- make Player handle lookup
   self.x = x
   self.y = y
   self.h = h
   self.w = w
   self.name = name
   self.speed = 200
   self.state = "idle_l"
   self.img = love.graphics.newImage('/img/pumpkin_dude.png')
   local g = anim8.newGrid(16, 32, self.img:getWidth(), self.img:getHeight())
   self.anim_walk_r = anim8.newAnimation(g('2-8',1), 0.1)
   self.anim_idle_r = anim8.newAnimation(g('1-2',1), 0.4)
   self.anim_walk_l = anim8.newAnimation(g('8-2',2), 0.1)
   self.anim_idle_l = anim8.newAnimation(g('7-8',2), 0.4)
   return self
end

function Player:move(dt)
   local isMoving = false
   if love.keyboard.isDown("w") then
      self.y = self.y - self.speed*dt
      if self.state=="idle_r" or self.state=="walk_r" then
         self.state="walk_r"
      else
         self.state="walk_l"
      end
      isMoving=true
   end
   if love.keyboard.isDown("s") then
      self.y = self.y + self.speed*dt
      isMoving=true
      if self.state=="idle_r" or self.state=="walk_r" then
         self.state="walk_r"
      else
         self.state="walk_l"
      end
   end
   if love.keyboard.isDown("d") then
      self.x = self.x + self.speed*dt
      isMoving=true
      self.state="walk_r"
   end
   if love.keyboard.isDown("a") then
      self.x = self.x - self.speed*dt
      isMoving=true
      self.state="walk_l"
   end
   if not isMoving and self.state=="walk_r" then
      self.state="idle_r"
   end
   if not isMoving and self.state=="walk_l" then
      self.state="idle_l"
   end
end

function Player:draw()
   if(self.state=="walk_r") then
      self.anim_walk_r:draw(self.img, self.x, self.y, nil, 2)
   end
   if(self.state=="idle_r") then
      self.anim_idle_r:draw(self.img, self.x, self.y, nil, 2)
   end
   if(self.state=="walk_l") then
      self.anim_walk_l:draw(self.img, self.x, self.y, nil, 2)
   end
   if(self.state=="idle_l") then
      self.anim_idle_l:draw(self.img, self.x, self.y, nil, 2)
   end
end

function Player:update_anim(dt)
   self.anim_walk_r:update(dt)
   self.anim_walk_l:update(dt)
   self.anim_idle_r:update(dt)
   self.anim_idle_l:update(dt)
end
