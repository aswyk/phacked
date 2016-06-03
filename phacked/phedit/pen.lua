pen = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
pen.__index = pen

local lg = love.graphics
local lk = love.keyboard
local font_14 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 14)

function pen.create(r, g, b, a)

    local self = setmetatable({}, pen)

    self.m_r = r
    self.m_g = g
    self.m_b = b
    self.m_a = a

    self.m_xPosition = 0
    self.m_yPosition = 0

    self.m_points = {}

    self.m_snapSize = 20

    return self
end

function pen:setPosition(x, y)
    self.m_xPosition = x
    self.m_yPosition = y
end


function pen:addPointAuto()

    self:addPoint(self.m_xPosition, self.m_yPosition)
end

--[[
    pen:addPoint. Snap to grid algorithm
]]--
function pen:addPoint(x, y)

    mx = math.fmod(x, self.m_snapSize)
    my = math.fmod(y, self.m_snapSize)

    if mx > self.m_snapSize/2 then
        x = x + self.m_snapSize - mx
    else
        x = x - mx
    end

    if my > self.m_snapSize/2 then
        y = y + self.m_snapSize - my
    else
        y = y - my
    end

    table.insert(self.m_points, x)
    table.insert(self.m_points, y)

end

function pen:draw()

    lg.push()

    local mx, my = love.mouse.getPosition()
    local len = table.getn(self.m_points)

    if table.getn(self.m_points) >= 4 then


        for i = 1, len-1, 2 do
            love.graphics.circle("fill", self.m_points[i], self.m_points[i+1], 3, 12) -- Draw white circle with 100 segments.
        end

        lg.setColor(self.m_r, self.m_g, self.m_b, self.m_a)
        lg.line(self.m_points)

        lg.setColor(200, 200, 200, 200)

        lg.line(self.m_points[len-1], self.m_points[len], mx, my)

    end

    lg.pop()

end
