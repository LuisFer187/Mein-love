require("classes/Player")

local player

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    player = Player:create(100, 100, 16, 32, "ann")
end

function love.update(dt)
    player:move(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end