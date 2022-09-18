require("classes/Player")
require("classes/Bullet")

local player
local bullets = {}

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    player = Player:create(100,100,16,32,"a")
end

function love.update(dt)
    player:update_anim(dt)
    player:move(dt)
    if love.mouse.isDown(1) then
       local bu = Bullet:create(player.x, player.y, 2)
       bullets = {next=bullets, value=bu}
    end
end

function love.draw()
    player:draw()
end