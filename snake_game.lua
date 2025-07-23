local SnakeGame = {}
local HighScore = require("highscore")

SnakeGame.__index = SnakeGame

function SnakeGame:new()
    local game = {
        snake = {
            {x = 10, y = 10}
        },
        direction = {x = 1, y = 0},
        food = {x = math.random(0, 30), y = math.random(0, 20)},
        score = 0,
        highscore = HighScore:load(),
        gameOver = false,
        timer = 0,
        speed = 0.2 
    }
    return setmetatable(game, SnakeGame)
end

function SnakeGame:update(dt)
    if self.gameOver then return end

    self.timer = self.timer + dt
    if self.timer >= self.speed then
        self.timer = 0

        
        local head = self.snake[1]
        local newHead = {
            x = head.x + self.direction.x,
            y = head.y + self.direction.y
        }

        -- Check wall collision
        if newHead.x < 0 or newHead.x > 40 or newHead.y < 0 or newHead.y > 30 then
            self.gameOver = true
            if self.score > self.highscore then
    HighScore:save(self.score)
    self.highscore = self.score
end

            return
        end

        -- Check self collision
        for _, segment in ipairs(self.snake) do
            if segment.x == newHead.x and segment.y == newHead.y then
                self.gameOver = true
                if self.score > self.highscore then
                    HighScore:save(self.score)
                    self.highscore = self.score
                end
                return
            end
        end

        -- Insert new head
        table.insert(self.snake, 1, newHead)

        -- Check food
        if newHead.x == self.food.x and newHead.y == self.food.y then
            self.score = self.score + 1
            self.food = {
                x = math.random(0, 40),
                y = math.random(0, 30)
            }
        else
            table.remove(self.snake) 
        end
    end
end

function SnakeGame:draw()
    local size = 15


local size = 15

for i, segment in ipairs(self.snake) do
    if i == 1 then
        
        love.graphics.setColor(0, 0.5, 0) 
    else
        love.graphics.setColor(0, 0.8, 0) 
    end

    love.graphics.rectangle("fill", segment.x * size, segment.y * size, size, size, 4, 4)

   
    if i == 1 then
        love.graphics.setColor(1, 1, 1) 
        love.graphics.circle("fill", segment.x * size + 4, segment.y * size + 4, 2)
        love.graphics.circle("fill", segment.x * size + size - 4, segment.y * size + 4, 2)
    end
end



love.graphics.setColor(1, 0, 0) 
love.graphics.circle("fill", self.food.x * size + size / 2, self.food.y * size + size / 2, size / 2)


love.graphics.setColor(0, 0.6, 0) 
love.graphics.rectangle("fill", self.food.x * size + size / 2 - 1, self.food.y * size + 2, 2, 4)


    -- Score
    love.graphics.print("Score: " .. self.score, 10, 10)
    love.graphics.print("High Score: " .. self.highscore, 10, 30)


    -- Game Over
if self.gameOver then
    love.graphics.setColor(0, 1, 0)
    love.graphics.printf("Game Over! Press R to play again or Esc to quit.", 0, 200, love.graphics.getWidth(), "center")
    love.graphics.setColor(1, 1, 1)
end


    
end

function SnakeGame:changeDirection(dx, dy)
    -- Prevent opposite direction
    if #self.snake > 1 then
        local head = self.snake[1]
        local neck = self.snake[2]
        if head.x + dx == neck.x and head.y + dy == neck.y then
            return
        end
    end
    self.direction = {x = dx, y = dy}
end

function SnakeGame:reset()
    -- Reset everything to starting state
    self.snake = {
        {x = 10, y = 10}
    }
    self.direction = {x = 1, y = 0}
    self.food = {x = math.random(0, 30), y = math.random(0, 20)}
    self.score = 0
    self.gameOver = false
    self.timer = 0
end


return SnakeGame
