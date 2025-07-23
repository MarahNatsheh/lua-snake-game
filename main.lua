local GameState = require("gamestate")
local Input = require("input")

local gameState = GameState:new()
local input = Input:new()

function love.load()
    -- Bind input keys using the command pattern
    input:bind("up", function() gameState.states.playing:changeDirection(0, -1) end)
    input:bind("down", function() gameState.states.playing:changeDirection(0, 1) end)
    input:bind("left", function() gameState.states.playing:changeDirection(-1, 0) end)
    input:bind("right", function() gameState.states.playing:changeDirection(1, 0) end)
end

function love.update(dt)
    gameState:update(dt)
end

function love.draw()
    gameState:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if gameState.current == "playing" then
        input:handleKey(key)

        if key == "r" then
            gameState.states.playing:reset()
        end

    elseif key == "return" or key == "space" then
        gameState:switch("playing")
    end
end


