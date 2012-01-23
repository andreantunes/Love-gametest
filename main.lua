require 'require.lua'

function love.update(dt)
    g_game:poll(dt)
end

function love.load()
    g_game:init()
end

function love.draw()
    g_camera:draw()
end