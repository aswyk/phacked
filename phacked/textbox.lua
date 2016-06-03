textbox = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
textbox.__index = textbox

local lg = love.graphics
local lk = love.keyboard
local font_12 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 12)

function textbox.create(text, width, height)
    local self = setmetatable({}, textbox)

    self.m_text = text

    self.m_x = 0
    self.m_y = 0

    self.m_width = width
    self.m_height = height
    self.m_bw = 3;

    -- Creating framebuffer for the shell
    self.m_textbox = love.graphics.newCanvas( self.m_width, self.m_height )

    -- Default textbox background color values
    self.m_br = 100
    self.m_bg = 100
    self.m_bb = 255
    self.m_ba = 255

    -- Default textbox text color values
    self.m_tr = 255
    self.m_tg = 255
    self.m_tb = 255
    self.m_ta = 255

    return self
end

function textbox:setPosition(x, y)
    self.m_x = x
    self.m_y = y
end

function textbox:setBoxColor(r, g, b, a)
    self.m_br = r
    self.m_bg = g
    self.m_bb = b
    self.m_ba = a
end

function textbox:setTextColor(r, g, b, a)
    self.m_tr = r
    self.m_tg = g
    self.m_tb = b
    self.m_ta = a
end

function textbox:draw()

    --lg.setCanvas(self.m_textbox)

    --lg.clear()

    lg.push()

        --lg.translate(self.m_x, self.m_y)
        --lg.setColor(50,255,50,255)
        lg.setColor(self.m_tr ,self.m_tg ,self.m_tb ,self.m_ta)
        lg.line(self.m_x - self.m_bw,
                self.m_y - self.m_bw,

                self.m_x + self.m_width + self.m_bw,
                self.m_y - self.m_bw,

                self.m_x + self.m_width + self.m_bw,
                self.m_y + self.m_height + self.m_bw,

                self.m_x - self.m_bw,
                self.m_y + self.m_height + self.m_bw,

                self.m_x - self.m_bw,
                self.m_y - self.m_bw)


        -- Console main area
        lg.setColor(self.m_br ,self.m_bg ,self.m_bb ,self.m_ba)
        lg.rectangle('fill', self.m_x, self.m_y, self.m_width, self.m_height)



        lg.push()
            love.graphics.setFont(font_12)
            lg.setColor(self.m_tr ,self.m_tg ,self.m_tb ,self.m_t)
            lg.print( self.m_text, self.m_x + 20, self.m_y + 20)
        lg.pop()

    lg.pop()

    --lg.setCanvas()

end
