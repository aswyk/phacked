callout = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
callout.__index = callout

local lg = love.graphics
local lk = love.keyboard
local font_16 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 16)

function callout.create(text, width, height)
    local self = setmetatable({}, callout)

    self.m_text = text

    self.m_x = 0
    self.m_y = 0

    self.m_width = width
    self.m_height = height
    self.m_bw = 3;

    self.m_anchorX = nil
    self.m_anchorY = nil

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

function callout:setAnchorPosition(x, y)
    self.m_anchorX = x
    self.m_anchorY = y
end

function callout:setPosition(x, y)
    self.m_x = x
    self.m_y = y
end

function callout:setBoxColor(r, g, b, a)
    self.m_br = r
    self.m_bg = g
    self.m_bb = b
    self.m_ba = a
end

function callout:setTextColor(r, g, b, a)
    self.m_tr = r
    self.m_tg = g
    self.m_tb = b
    self.m_ta = a
end

function callout:draw()

    --lg.setCanvas(self.m_textbox)

    --lg.clear()

    lg.push()

        --lg.translate(self.m_x, self.m_y)
        --lg.setColor(50,255,50,255)
        lg.setColor(self.m_tr ,self.m_tg ,self.m_tb ,self.m_ta)

        -- the callout is only different to the textbox in that it has a label anchor
        lg.line(self.m_x - self.m_bw,
                self.m_y - self.m_bw,

                self.m_x + self.m_width + self.m_bw,
                self.m_y - self.m_bw,

                self.m_x + self.m_width + self.m_bw,
                self.m_y + self.m_height + self.m_bw,

                --[[
                self.m_x + self.m_width/2.0 + 10 - 40 ,
                self.m_y + self.m_height + self.m_bw,

                -- pin
                self.m_x + self.m_width/2.0 - 50 - 10,
                self.m_y + self.m_height + self.m_bw + 70,

                self.m_x + self.m_width/2.0 - 10 - 40 ,
                self.m_y + self.m_height + self.m_bw,
                ]]--
                self.m_x - self.m_bw,
                self.m_y + self.m_height + self.m_bw,

                self.m_x - self.m_bw,
                self.m_y - self.m_bw)

        if self.m_anchorX == nil then
        else
            lg.line(self.m_x - self.m_bw,
                    self.m_y + self.m_height + self.m_bw,
                    self.m_anchorX,
                    self.m_anchorY)
        end



        -- Console main area
        lg.setColor(self.m_br ,self.m_bg ,self.m_bb ,self.m_ba)
        lg.rectangle('fill', self.m_x, self.m_y, self.m_width, self.m_height)



        lg.push()
            love.graphics.setFont(font_16)
            lg.setColor(self.m_tr ,self.m_tg ,self.m_tb ,self.m_t)
            lg.print( self.m_text, self.m_x + 20, self.m_y + 20)
        lg.pop()

    lg.pop()

    --lg.setCanvas()
end
