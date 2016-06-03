require("config")

require("shell")
require("textbox")
require("callout")
require("keyboard")


local term = shell.create("phack", "mac", "/Users/phack/")
local kb = keyboard.create()
local notice = textbox.create("Hello, World!", 300, 100)
local co = callout.create("Whoop! Whoop!!", 250, 75)

local lg = love.graphics

function fp_foo ()
    return function()
        print("callback")
    end
end

function love.load()
    font = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 12)
    love.graphics.setFont(font)

    notice:setPosition(100, 100)
    notice:setBoxColor(200,100,100,150)

    co:setPosition(200, 350)
    co:setBoxColor(255,50,50,150)
    co:setAnchorPosition(150, 500)


    ---kb.setPressedCallback(fp_foo())

end

function love.keypressed(key, scancode, isrepeat)

    term:keyPressed(key, scancode, isrepeat)

    kb:keyPressed(key)


end

function love.keyreleased(key, scancode)

    kb:keyReleased(key)

end

function love.mousemoved( x, y, dx, dy )
    co:setAnchorPosition(x, y)
end

local count = 0

function love.draw()
    --[[
    count = count + 1

    if count >= 100 then
        count = 0
        kb:clearKeyDownBuffer()
        kb:clearKeyUpBuffer()
    end
    ]]--

    lg.push()

        --lg.setColor(255,100,100,150)
        --lg.line(5,5,  210,5,  210,110,  5,110,  5,5)

    lg.pop()

    --lg.setColor(255,150,150,255)
    --lg.print("Count           : " .. count, 10, 10)
    --kb:debugDraw()

    notice:draw()
    co:draw()

    term:draw()



end
