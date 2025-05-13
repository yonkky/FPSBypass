local function CreateFPSBypassGUI()
    -- Создаем основной интерфейс
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "FPSBypassGUI"
    ScreenGui.ResetOnSpawn = false

    -- Главный фрейм
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 120)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- Скругление углов
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    -- Верхняя красная панель
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    -- Скругление только верхних углов
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar

    -- Градиентный переход
    local GlowEffect = Instance.new("Frame")
    GlowEffect.Size = UDim2.new(1, 0, 0, 4)
    GlowEffect.Position = UDim2.new(0, 0, 0, 30)
    GlowEffect.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    GlowEffect.BorderSizePixel = 0
    GlowEffect.Parent = MainFrame

    -- Надпись в верхней панели
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

    -- Кнопка закрытия
    local CloseButton = Instance.new("TextButton")
    CloseButton.Text = "×"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.BackgroundTransparency = 1
    CloseButton.TextColor3 = Color3.fromRGB(30, 30, 30)
    CloseButton.TextSize = 20
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TopBar

    -- Контейнер для функции FPSBypass
    local FunctionContainer = Instance.new("Frame")
    FunctionContainer.Size = UDim2.new(0.9, 0, 0, 40)
    FunctionContainer.Position = UDim2.new(0.05, 0, 0.4, 0)
    FunctionContainer.BackgroundTransparency = 1
    FunctionContainer.Parent = MainFrame

    -- Индикатор состояния
    local StatusIndicator = Instance.new("Frame")
    StatusIndicator.Size = UDim2.new(0, 12, 0, 12)
    StatusIndicator.Position = UDim2.new(0, 5, 0.5, -6)
    StatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    StatusIndicator.BorderSizePixel = 0
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = StatusIndicator
    StatusIndicator.Parent = FunctionContainer

    -- Кнопка активации
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Text = "FPSBypass"
    ToggleButton.Size = UDim2.new(0, 120, 1, 0)
    ToggleButton.Position = UDim2.new(0, 20, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    ToggleButton.Font = Enum.Font.Gotham
    ToggleButton.TextSize = 14
    ToggleButton.Parent = FunctionContainer

    -- Затемнение вокруг кнопки
    local ButtonGlow = Instance.new("Frame")
    ButtonGlow.Size = UDim2.new(1, 4, 1, 4)
    ButtonGlow.Position = UDim2.new(0, -2, 0, -2)
    ButtonGlow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ButtonGlow.BorderSizePixel = 0
    ButtonGlow.ZIndex = -1
    
    local ButtonGlowCorner = Instance.new("UICorner")
    ButtonGlowCorner.CornerRadius = UDim.new(0, 6)
    ButtonGlowCorner.Parent = ButtonGlow
    ButtonGlow.Parent = ToggleButton

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = ToggleButton

    -- Поле для ввода значения
    local ValueInput = Instance.new("TextBox")
    ValueInput.Size = UDim2.new(0, 80, 1, 0)
    ValueInput.Position = UDim2.new(1, -80, 0, 0)
    ValueInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ValueInput.TextColor3 = Color3.fromRGB(200, 200, 200)
    ValueInput.PlaceholderText = "FPS Value"
    ValueInput.Text = "60"
    ValueInput.Font = Enum.Font.Gotham
    ValueInput.TextSize = 14
    ValueInput.Parent = FunctionContainer

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = ValueInput

    -- Счетчик FPS (правый нижний угол экрана)
    local FPSFrame = Instance.new("Frame")
    FPSFrame.Size = UDim2.new(0, 100, 0, 30)
    FPSFrame.Position = UDim2.new(1, -110, 1, -40)
    FPSFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    FPSFrame.BorderSizePixel = 0
    FPSFrame.Parent = ScreenGui
    
    local FPSCorner = Instance.new("UICorner")
    FPSCorner.CornerRadius = UDim.new(0, 8)
    FPSCorner.Parent = FPSFrame
    
    local FPSLabel = Instance.new("TextLabel")
    FPSLabel.Size = UDim2.new(1, -10, 1, -10)
    FPSLabel.Position = UDim2.new(0, 5, 0, 5)
    FPSLabel.BackgroundTransparency = 1
    FPSLabel.Text = "FPS: 60"
    FPSLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    FPSLabel.Font = Enum.Font.Gotham
    FPSLabel.TextSize = 14
    FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
    FPSLabel.Parent = FPSFrame

    -- Уведомления
    local NotificationGui = Instance.new("ScreenGui")
    NotificationGui.Parent = game.CoreGui
    NotificationGui.Name = "Notifications"

    -- Состояние FPSBypass
    local FPSBypassActive = false
    local CurrentFPS = 60
    local LastValue = "60"

    -- Функция блокировки/разблокировки ввода
    local function SetInputState(enabled)
        ValueInput.BackgroundColor3 = enabled and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(20, 20, 20)
        ValueInput.TextColor3 = enabled and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(100, 100, 100)
        ValueInput.TextEditable = enabled
    end

    -- Функция показа уведомления
    local function ShowNotification(message)
        local Notification = Instance.new("Frame")
        Notification.Size = UDim2.new(0, 200, 0, 40)
        Notification.Position = UDim2.new(1, -210, 1, -50)
        Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notification.BorderSizePixel = 0
        
        local NotificationCorner = Instance.new("UICorner")
        NotificationCorner.CornerRadius = UDim.new(0, 8)
        NotificationCorner.Parent = Notification
        
        local NotificationText = Instance.new("TextLabel")
        NotificationText.Size = UDim2.new(1, -10, 1, -10)
        NotificationText.Position = UDim2.new(0, 5, 0, 5)
        NotificationText.BackgroundTransparency = 1
        NotificationText.Text = message
        NotificationText.TextColor3 = Color3.fromRGB(200, 200, 200)
        NotificationText.Font = Enum.Font.Gotham
        NotificationText.TextSize = 12
        NotificationText.Parent = Notification
        
        Notification.Parent = NotificationGui
        
        -- Анимация исчезновения
        delay(3, function()
            for i = 1, 10 do
                Notification.BackgroundTransparency = i/10
                NotificationText.TextTransparency = i/10
                wait(0.05)
            end
            Notification:Destroy()
        end)
    end

    -- Функция обновления индикатора
    local function UpdateIndicator()
        StatusIndicator.BackgroundColor3 = FPSBypassActive and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
        ToggleButton.Text = FPSBypassActive and "FPSBypass: ON" or "FPSBypass: OFF"
        SetInputState(not FPSBypassActive)
        
        if FPSBypassActive then
            ValueInput.Text = CurrentFPS
        else
            LastValue = ValueInput.Text
        end
    end

    -- Обработчик кнопки
    ToggleButton.MouseButton1Click:Connect(function()
        local newValue = tonumber(ValueInput.Text) or 60
        
        -- Проверка значения
        if newValue <= 0 then
            ShowNotification("Вы не можете поставить значение "..tostring(newValue))
            return
        end
        
        FPSBypassActive = not FPSBypassActive
        CurrentFPS = newValue
        
        -- Применение FPSBypass
        if FPSBypassActive then
            setfpscap(CurrentFPS)
        else
            setfpscap(60)
            ValueInput.Text = LastValue
        end
        
        UpdateIndicator()
    end)

    -- Обработчик закрытия
    CloseButton.MouseButton1Click:Connect(function()
        -- Отключаем FPSBypass перед закрытием
        if FPSBypassActive then
            setfpscap(60)
        end
        ScreenGui:Destroy()
        NotificationGui:Destroy()
        FPSFrame:Destroy()
    end)

    -- Перетаскивание
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragStart, startPos

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                         startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Обновление счетчика FPS
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

    -- Инициализация
    UpdateIndicator()
end

-- Запускаем создание GUI
CreateFPSBypassGUI()
