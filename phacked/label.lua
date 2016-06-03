Label = {}--{ prompt = "$USER$ on $MACHINE$ in $PATH$"}
Label.__index = Label


local lg = love.graphics

function Label.new()

    local self = setmetatable({}, shell)
    --local self = {}

    self.name = "Frodo"

    return self
end


function Label:draw()
    lg.push()

    lg.print("Label::draw", 50, 50)

    print("wooot");

    lg.pop()
end
