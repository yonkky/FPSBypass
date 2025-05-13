local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "FPSBypassUI"

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 150)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 8)
TopBarCorner.Parent = TopBar

local GlowEffect = Instance.new("Frame")
GlowEffect.Size = UDim2.new(1, 0, 0, 4)
GlowEffect.Position = UDim2.new(0, 0, 0, 30)
GlowEffect.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
GlowEffect.BorderSizePixel = 0
GlowEffect.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Text = "FPSBYPASS by yonkk"
TitleLabel.Size = UDim2.new(0, 180, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "×"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(30, 30, 30)
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TopBar

local ToggleButton = Instance.new("TextButton")
ToggleButton.Text = "FPSBypass: OFF"
ToggleButton.Size = UDim2.new(0.9, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.05, 0, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ToggleButton

local ButtonGlow = Instance.new("Frame")
ButtonGlow.Size = UDim2.new(1, 4, 1, 4)
ButtonGlow.Position = UDim2.new(0, -2, 0, -2)
ButtonGlow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ButtonGlow.BorderSizePixel = 0
ButtonGlow.ZIndex = -1
ButtonGlow.Parent = ToggleButton

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(0, 6)
GlowCorner.Parent = ButtonGlow

local StatusIndicator = Instance.new("Frame")
StatusIndicator.Size = UDim2.new(0, 12, 0, 12)
StatusIndicator.Position = UDim2.new(0, 10, 0.5, -6)
StatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
StatusIndicator.BorderSizePixel = 0
StatusIndicator.Parent = ToggleButton

local IndicatorCorner = Instance.new("UICorner")
IndicatorCorner.CornerRadius = UDim.new(1, 0)
IndicatorCorner.Parent = StatusIndicator

local ValueInput = Instance.new("TextBox")
ValueInput.Size = UDim2.new(0, 80, 0, 30)
ValueInput.Position = UDim2.new(0.7, 0, 0.5, -15)
ValueInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ValueInput.TextColor3 = Color3.fromRGB(200, 200, 200)
ValueInput.PlaceholderText = "FPS Value"
ValueInput.Text = "120"
ValueInput.Font = Enum.Font.Gotham
ValueInput.TextSize = 14
ValueInput.Parent = ToggleButton

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = ValueInput

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(0, 100, 0, 30)
FPSLabel.Position = UDim2.new(1, -110, 1, -40)
FPSLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FPSLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
FPSLabel.Text = "FPS: 60"
FPSLabel.Font = Enum.Font.Gotham
FPSLabel.TextSize = 14
FPSLabel.Parent = ScreenGui

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 8)
FPSCorner.Parent = FPSLabel

local FPSBypassActive = false
local CurrentFPS = 120

local function UpdateIndicator()
    StatusIndicator.BackgroundColor3 = FPSBypassActive and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    ToggleButton.Text = FPSBypassActive and "FPSBypass: ON" or "FPSBypass: OFF"
    ValueInput.BackgroundColor3 = FPSBypassActive and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(40, 40, 40)
    ValueInput.TextColor3 = FPSBypassActive and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(200, 200, 200)
    ValueInput.TextEditable = not FPSBypassActive
end

ToggleButton.MouseButton1Click:Connect(function()
    local newValue = tonumber(ValueInput.Text) or 120
    
    if newValue <= 0 then
        ValueInput.Text = tostring(CurrentFPS)
        return
    end
    
    FPSBypassActive = not FPSBypassActive
    CurrentFPS = newValue
    
    if FPSBypassActive then
        setfpscap(CurrentFPS)
    else
        setfpscap(60)
    end
    
    UpdateIndicator()
end)

CloseButton.MouseButton1Click:Connect(function()
    if FPSBypassActive then
        setfpscap(60)
    end
    ScreenGui:Destroy()
end)

local lastTick = tick()
local frames = 0
game:GetService("RunService").Heartbeat:Connect(function()
    frames = frames + 1
    if tick() - lastTick >= 1 then
        FPSLabel.Text = "FPS: "..math.floor(frames)
        frames = 0
        lastTick = tick()
    end
end)

UpdateIndicator()
