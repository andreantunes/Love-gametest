require 'require.lua'

function love.update(dt)
    g_game:poll(dt)
end

function love.load()
    g_game:init()
    math.randomseed(os.time())
end

function love.draw()
    g_camera:draw()
end