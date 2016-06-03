grid = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
grid.__index = grid

local lg = love.graphics
local lk = love.keyboard
local font_14 = love.graphics.newFont("assets/fonts/Hack-Regular.ttf", 14)

function grid.create(width, height, gap)

    local self = setmetatable({}, grid)

    self.m_width = width
    self.m_height = height
    self.m_gap = gap

    -- Set to a default green color
    self.m_r = 150
    self.m_g = 255
    self.m_b = 150
    self.m_a = 100

    return self
end

function grid:draw()
    --[[
    lg.push()

    if table.getn(self.m_points) >= 4 then

        lg.setColor(self.m_r, self.m_g, self.m_b, self.m_a)
        lg.line(self.m_points)

    end

    lg.pop()
    ]]--

    lg.push()

    lg.setColor(self.m_r, self.m_g, self.m_b, self.m_a)

    for i = 1, 36 do
        lg.line( 0, 20*i, 1280, 20*i)
    end

    for i = 1, 64 do
        lg.line(20*i, 0 ,20*i, 720)
    end

    lg.pop()
end
