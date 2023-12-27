local chestsn = {
    "Animated",
    -- Add other chest names here
}

local function contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

while task.wait(0.1) do  -- Use a shorter wait time for smoother updates
    for __, v in pairs(game.Workspace["__THINGS"].__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetChildren()) do
        if v:FindFirstChild("ESP") then
            v.ESP:Destroy()  -- Clear any existing ESP
        end

        if contains(chestsn, v.Name) then
            local tcolor = Color3.fromRGB(222, 184, 135)  -- Default color
            if v.Name == "Animated" then
                tcolor = Color3.fromRGB(135, 206, 250)  -- Special color for animated chests
            end

            local esp = Instance.new("BillboardGui", v)
            esp.Name = "ESP"
            esp.Size = UDim2.new(0, 100, 0, 100)  -- Size of the ESP
            esp.AlwaysOnTop = true
            esp.MaxDistance = 100  -- Set a maximum visibility distance

            local frame = Instance.new("Frame", esp)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0.5  -- Slightly more transparent
            frame.BorderSizePixel = 0
            frame.BackgroundColor3 = tcolor
            frame.ZIndex = 10  -- Ensure text is on top of frame

            local textLabel = Instance.new("TextLabel", frame)
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.Text = "Chest"
            textLabel.TextScaled = true  -- Auto-scale text
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = tcolor
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextStrokeTransparency = 0.5

            local outline = Instance.new("ImageLabel", esp)
            outline.Image = "rbxassetid://554054954"  -- Add a glowing outline
            outline.Size = UDim2.new(1.2, 0, 1.2, 0)
            outline.Position = UDim2.new(-0.1, 0, -0.1, 0)
            outline.ZIndex = 5  -- Place outline behind text and frame
            outline.ImageTransparency = 0.8
            outline.ImageColor3 = tcolor
            outline.ScaleType = Enum.ScaleType.Slice
            outline.SliceCenter = Rect.n
ew(100, 100, 100, 100)
        end
    end
end
