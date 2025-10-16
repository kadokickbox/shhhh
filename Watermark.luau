local function CreateInstance(ClassName: string, Properties: table) 
    local instance = Instance.new(ClassName) 
    for k, v in pairs(Properties) do 
        if typeof(k) ~= 'string' then
            continue
        end

        instance[k] = v
    end
    return instance
end

local Watermark = CreateInstance("ScreenGui", {
    Parent = game:GetService("CoreGui"),
    Name = "YunaWatermark"
})

local Holder = CreateInstance("Frame", {
    Parent = Watermark,
    Name = "Holder",
    AnchorPoint = Vector2.new(1, 1),
    BackgroundTransparency = 1,
    Position = UDim2.new(0.007, 100, 1, 0),
    Size = UDim2.fromOffset(100, 100)
})

-- // the logo looks dark for some reason, so i js try to increase visibility by creating it 6x
for i = 1, 6 do
    CreateInstance("ImageLabel", {
        Parent = Holder,
        Name = "Logo",
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.49, 0),
        Size = UDim2.fromScale(0.7, 0.7),
        Image = "rbxassetid://125150956324053"
    })
end

local Inv = CreateInstance("TextLabel", {
    Parent = Holder,
    AnchorPoint = Vector2.new(0.5, 1),
    BackgroundTransparency = 1,
    Position = UDim2.fromScale(0.56, 0.85),
    Size = UDim2.fromScale(1.33, 0.2),

    TextScaled = true,
    TextWrapped = true,
    Text = "discord.gg/yunahub",
    TextColor3 = Color3.fromRGB(245, 247, 241),
    FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
})
