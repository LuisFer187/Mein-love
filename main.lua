require("classes/Player")

local player

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    player = Player:create(100,100,16,32,"a")
end

function love.update(dt)
    player:update_anim(dt)
    player:move(dt)
    player:shoot()
end

function love.draw()
    player:draw()
end