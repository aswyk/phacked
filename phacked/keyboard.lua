keyboard = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
keyboard.__index = keyboard

local lg = love.graphics

function keyboard.create()
    local self = setmetatable({}, keyboard)

    self.m_keys = {}
    self.m_repeated = {}

    self.m_keyDownBuffer = {}
    self.m_keyUpBuffer = {}

    self.event = 0

    return self
end

function keyboard:debugDraw()
    lg.push()

    lg.setColor(150,150,255,255)
    lg.print("Key Down Buffer : " .. table.getn(self.m_keyDownBuffer), 10, 30)
    lg.print("Key Up Buffer   : " .. table.getn(self.m_keyUpBuffer), 10, 50)

    lg.pop()
end

function keyboard:keyPressed(key)

    self.m_keys[key] = 1;

    table.insert(self.m_keyDownBuffer, key)
end

function keyboard:keyReleased(key)

    self.m_keys[key] = 0;

    table.insert(self.m_keyUpBuffer, key)
end

function keyboard:isKeyDown(key)
    if self.m_keys[key] == 1 then
        return 1
    else
        return 0
    end
end

function keyboard:getKeyDownBufferLength()
    return table.getn(self.m_keyDownBuffer)
end

function keyboard:getKeyUpBufferLength()
    return table.getn(self.m_keyUpBuffer)
end

function keyboard:clearKeyDownBuffer()

    for k in pairs (self.m_keyDownBuffer) do
        self.m_keyDownBuffer[k] = nil
    end
end

function keyboard:clearKeyUpBuffer()

    for k in pairs (self.m_keyUpBuffer) do
        self.m_keyUpBuffer[k] = nil
    end
end

function keyboard:checkEvent()
    return self.event
end

function keyboard:clearEvent()
    self.event = 0
end

function keyboard:setPressedCallback(fpCallback)
    --self.fp = fpCallback
end
