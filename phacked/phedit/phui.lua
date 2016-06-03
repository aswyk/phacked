phui = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
phui.__index = phui

local lg = love.graphics
local lk = love.keyboard
local font_14 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 14)

function phui.create(ui)

    local self = setmetatable({}, phui)

    self.m_gui = ui

    self.m_buttons = {}

    return self
end


--[[
        Code section START for adding widgets to UI
]]--


-- Function for adding a button to UI
function phui:addButton(name, x, y, w, h)
    --local button = gui:button('A Button', {x = 128, y = gui.style.unit, w = 128, h = gui.style.unit}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
	--button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
	--	gui:feedback('Clicky')
	--end

    --[[
    self button = self.m_gui:button('A Button', {x = 128, y = self.m_gui.style.unit, w = 128, h = self.m_gui.style.unit}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
    button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
        print("badaboom")
    	gui:feedback('Clicky')
    end
    ]]--

    self.m_buttons[name] = self.m_gui:button("Butz", {x = 128, y = self.m_gui.style.unit, w = 128, h = self.m_gui.style.unit})
    self.m_buttons[name].click = function(this, x, y)
        self.m_gui:feedback("Clicky")
    end

    --button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
    --    print("badaboom")
	--	self.m_gui:feedback('Clicky')
	--end
end



--[[
        Code section END for adding widgets to UI
]]--


function phui:draw()
    self.m_gui:draw()
end

-- update function
function phui:update(dt)
	self.m_gui:update(dt)
end

-- keypressed function
function phui:keypressed(key, code, isrepeat)

    if self.m_gui.focus then
		self.m_gui:keypress(key) -- only sending input to the gui if we're not using it for something else
	else
		if key == 'return'then -- binding enter key to input focus
			input:focus()
		elseif key == 'f1' then -- toggle show-hider
			if showhider.display then showhider:hide() else showhider:show() end
		else
			self.m_gui:feedback("key " .. key) -- why not
		end
	end
end

function phui:textinput(key)
    if self.m_gui.focus then
		--gui:textinput(key) -- only sending input to the gui if we're not using it for something else
        self.m_gui:textinput(key)
	end
end

function phui:mousepressed(x, y, button)
    --gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
    --self.m_gui:mousepress(x, y, button)

    self.m_gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
end

function phui:mousereleased(x, y, button)
    --gui:mouserelease(x, y, button)
    --self.m_gui:mousereleased(x, y, button)
end

function phui:wheelmoved(x, y)
    --gui:mousewheel(x, y)
    --self.m_gui:mousewheel(x, y)
end
