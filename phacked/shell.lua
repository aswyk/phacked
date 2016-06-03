shell = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
shell.__index = shell

local lg = love.graphics
local lk = love.keyboard
local font_14 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 14)

function shell.create(user, machine, dir)
    local self = setmetatable({}, shell)

    --
    self.m_user = user
    self.m_machine = machine
    self.m_dir = dir

    -- These variables are all used in the opperation of the movement and visibility of the shell
    self.m_toggle = false
    self.m_yOffset = -650
    self.m_yMin = -650
    self.m_yMax = -10
    self.m_toggleSpeed = 40

    self.m_shellActive = false

    -- loading image of shell. this is just testing for now.
    self.m_shellImg = love.graphics.newImage( "assets/image/shell_shade.png" )

    self.m_promptValue = ""

    -- Creating framebuffer for the shell
    self.m_fb = love.graphics.newCanvas( 800, 600, "normal", 16 )

    return self
end

function shell:toggle()
    self.m_toggle = not self.m_toggle
end

function shell:draw()

    --[[
        TODO : This code really needs to be moved to something like an update function, as
        it does not really draw anything, but rather calculates the position/offset of the
        terminal, and weather it should be translated any more based on the value of the
        self.m_toggle variable

        TODO : Perhaps we need a base class that has the update function that we can base
        classes or bajects such as the shell class, that way we can add the object to an array
        or something like that, that way we can iterate over objects that need to be updated.
    ]]--

    if self.m_toggle then
        if self.m_yOffset + self.m_toggleSpeed <= self.m_yMax then
            self.m_yOffset = self.m_yOffset + self.m_toggleSpeed
        else
            self.m_yOffset = self.m_yMax
            self.m_shellActive = true
        end
    else
        if self.m_yOffset >= self.m_yMin then
            self.m_yOffset = self.m_yOffset - self.m_toggleSpeed
        else
            self.m_shellActive = false
        end
    end

    -- Attemppting to draw to framebuffer for shell. Its not called framebuffer
    -- anymore, but rather "canvas"

    -- Changing framebuffers. This means any drawing commands will be drawing on the fb, duh. ;git add -
    lg.setCanvas(self.m_fb)

    lg.clear()

    lg.push()

        lg.translate(0, self.m_yOffset)
        lg.setColor(50,255,50,255)
        lg.line(5,5,  795,5,  795,595,  5,595,  5,5)

        --[[
        -- Console main area
        lg.setColor(150,255,150,100)
        lg.rectangle('fill', 8, 8, 784,584)

        -- Console history area
        lg.setColor(150,150,255,100)
        lg.rectangle('fill', 10, 8, 780,552)

        -- Console active line area
        lg.setColor(255,150,255,100)
        lg.rectangle('fill', 10, 565, 780,25)
        ]]--


        -- Console history area
        lg.setColor(150,150,255,150)
        lg.rectangle('fill', 10, 8, 780,552)

        -- Console active line area
        lg.setColor(255,150,255,150)
        lg.rectangle('fill', 10, 565, 780,25)

        lg.push()
            lg.setColor(150,255,150,255)
            --[[
                TODO : Need to figure out how to do syntax highligting. It could be done
                with seperate draw calls for each color, but that could be slow, and it would
                be a shlep to keep track of all the offsets and so on. Would probably be best
                make a class.. mhmm, that could be a lot of fun. we'll call it
                    colorPrinter, or something like that
            ]]--
            -- colors    blue         white        red           white        blue
            --lg.print( self.m_user .. " on " .. self.m_machine .. " in " .. self.m_dir .."\n"..  self.m_promptValue, 10, 560)
            love.graphics.setFont(font_14)
            lg.print( "$ " .. self.m_promptValue, 15, 570)
        lg.pop()

    lg.pop()

    lg.setCanvas()

    lg.draw(self.m_fb)
end


function shell:keyPressed( key, scancode, isrepeat )

    --[[
        TODO : Still need to impliment the handling of shift and so on. Right now its printing
        all that crud out.
        TODO : Also need to impliment the cursor. I eman to say that i want position. This
        way i can see where im typring and i can navigate around the command. typing in the
        middle of the buffer.
    ]]--

    if key == "`" then
        self.m_toggle = not self.m_toggle
        if self.m_toggle == false then
            self.m_shellActive = false
        end
    elseif self.m_shellActive then
        if key == "space" then
            self.m_promptValue = self.m_promptValue .. " "
        elseif key == "backspace" then
            self.m_promptValue = self.m_promptValue:sub(1, #self.m_promptValue - 1)
        else
            self.m_promptValue = self.m_promptValue .. key
        end
    end

end
