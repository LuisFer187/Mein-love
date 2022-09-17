Player = {}
Player.__index = Player

local anim8 = require("lib.anim8")
local ker

function Player:create(x, y, h, w, name)
   local plyr = {}             -- our new object
   setmetatable(plyr,Player)  -- make Player handle lookup
   plyr.x = x
   plyr.y = y
   plyr.h = h
   plyr.w = w
   plyr.name = name
   plyr.speed = 200
   plyr.state = "idle_l"
   plyr.img_r = love.graphics.newImage('/img/pumpkin_dude_right.png')
   plyr.img_l = love.graphics.newImage('/img/pumpkin_dude_left.png')
   local g = anim8.newGrid(16, 32, plyr.img_r:getWidth(), plyr.img_r:getHeight())
   plyr.anim_walk_r = anim8.newAnimation(g('2-8',1), 0.1)
   plyr.anim_idle_r = anim8.newAnimation(g('1-2',1), 0.4)
   plyr.anim_walk_l = anim8.newAnimation(g('2-8',1), 0.1)
   plyr.anim_idle_l = anim8.newAnimation(g('7-8',1), 0.4)
   return plyr
end

function Player:move(dt)
   local isMoving = false
   if love.keyboard.isDown("w") then
      self.y = self.y - self.speed*dt
      isMoving=true
   end
   if love.keyboard.isDown("s") then
      self.y = self.y + self.speed*dt
      isMoving=true
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
end

function Player:draw()
   if(self.state=="walk_r") then
      self.anim_walk_r:draw(self.img_r, self.x, self.y, nil, 2)
   end
   if(self.state=="idle_r") then
      self.anim_idle_r:draw(self.img_r, self.x, self.y, nil, 2)
   end
   if(self.state=="walk_l") then
      self.anim_walk_l:draw(self.img_l, self.x, self.y, nil, 2)
   end
   if(self.state=="idle_l") then
      self.anim_idle_l:draw(self.img_l, self.x, self.y, nil, 2)
   end
end

function Player:update(dt)
   self.anim_walk_r:update(dt)
   self.anim_walk_l:update(dt)
   self.anim_idle_r:update(dt)
   self.anim_idle_l:update(dt)
end
