package.path = package.path .. ";../?.lua"

require("config")

require("shell")
require("textbox")
require("callout")
require("keyboard")

require("pen")
require("grid")

require("phui")

--gui = require('Gspot')

local lg = love.graphics

local p = pen.create(255,150,150,200)
local g = grid.create(1280, 720, 20)

local points = {}

local UI = nil

local gui = require('Gspot')

function love.load()
    font = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 12)
    --cursorImageData = love.image.newImageData("assets/cursors/evo32.png")
    cursorImageData = love.image.newImageData("assets/cursors/blueRod.png")
    cursor = love.mouse.newCursor( cursorImageData, 0, 0 )
    love.mouse.setCursor( cursor )
    love.graphics.setFont(font)

    UI = phui.create(gui)

    UI:addButton("A Button", 128, 128, 128, 128)

end

--[[
    keypresed
]]--

function love.keypressed(key, code, isrepeat)

    UI:keypressed(key, code, isrepeat)

    if key == 'a' then
        p:addPointAuto()
    elseif key == 'd' then
        p:deleteLastPoint()
    end

    --[[if gui.focus then
		gui:keypress(key) -- only sending input to the gui if we're not using it for something else
	else
		if key == 'return'then -- binding enter key to input focus
			input:focus()
		elseif key == 'f1' then -- toggle show-hider
			if showhider.display then showhider:hide() else showhider:show() end
		else
			gui:feedback(key) -- why not
		end
	end]]
end



--[[
    update function
]]--

function love.update(dt)
	--gui:update(dt)
end



--[[
    draw function
]]--

function love.draw()
    g:draw()
    p:draw()
    --UI:draw()
end



--[[
    textinput function
    -- textinput function .. not sure what this is
]]--

function love.textinput(key)
    --[[if gui.focus then
		gui:textinput(key) -- only sending input to the gui if we're not using it for something else
	end]]
end

--[[
-- deal with 0.10 mouse API changes
love.mousepressed = function(x, y, button)
	gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
end
love.mousereleased = function(x, y, button)
	gui:mouserelease(x, y, button)
end
love.wheelmoved = function(x, y)
	gui:mousewheel(x, y)
end
]]--


function love.mousemoved(x, y)
    p:setPosition(x,y)
end


--[[
    mousepressed function
]]--

function love.mousepressed(x, y, button)
    --gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
    --phui:mousepress(x, y, button) -- pretty sure you want to register mouse events
    UI:mousepressed(x, y, button)
end



--[[
    mousereleased function
]]--

function love.mousereleased(x, y, button)
    --gui:mouserelease(x, y, button)
    --phui:mouserelease(x, y, button)
    UI:mousereleased(x, y, button)
end



--[[
    wheelmoved function
]]--

function love.wheelmoved(x, y)
    --gui:mousewheel(x, y)
    --phui:mousewheel(x, y)

    --UI:mousewheel(x, y)
end
