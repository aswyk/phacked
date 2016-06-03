package.path = package.path .. ";../?.lua"

require("config")

require("shell")
require("textbox")
require("callout")
require("keyboard")

require("pen")
require("grid")


local gui = require('Gspot')

local lg = love.graphics

local p = pen.create(255,150,150,200)
local g = grid.create(1280, 720, 20)

local points = {}

local UI = nil


function love.load()
    font = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 12)
    love.graphics.setFont(font)


    local button = gui:button('A Button', {x = 128, y = gui.style.unit, w = 128, h = gui.style.unit}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
	button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
        print("badaboom")
		gui:feedback('Clicky')
	end

end

-- keypressed function
function love.keypressed(key, code, isrepeat)

    if gui.focus then
		gui:keypress(key) -- only sending input to the gui if we're not using it for something else
	else
		if key == 'return'then -- binding enter key to input focus
			input:focus()
		elseif key == 'f1' then -- toggle show-hider
			if showhider.display then showhider:hide() else showhider:show() end
		else
			gui:feedback(key) -- why not
		end
	end
end




-- update function
function love.update(dt)
	gui:update(dt)
end




-- draw function
function love.draw()
    --g:draw()
    --p:draw()
    gui:draw()
end




-- textinput function .. not sure what this is
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

function love.mousepressed(x, y, button)
    gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
    --phui:mousepress(x, y, button) -- pretty sure you want to register mouse events
end

function love.mousereleased(x, y, button)
    --gui:mouserelease(x, y, button)
    --phui:mouserelease(x, y, button)
end

function love.wheelmoved(x, y)
    --gui:mousewheel(x, y)
    --phui:mousewheel(x, y)
end
