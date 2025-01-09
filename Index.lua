-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Notificação inicial
local notification = Instance.new("Frame")
notification.Size = UDim2.new(0, 300, 0, 100)
notification.Position = UDim2.new(0.5, -150, 0.5, -50)
notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
notification.BorderSizePixel = 0
notification.Parent = screenGui

local notificationShadow = Instance.new("ImageLabel")
notificationShadow.Size = UDim2.new(1, 20, 1, 20)
notificationShadow.Position = UDim2.new(0, -10, 0, -10)
notificationShadow.BackgroundTransparency = 1
notificationShadow.Image = "rbxassetid://1316045217"
notificationShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
notificationShadow.ImageTransparency = 0.5
notificationShadow.ZIndex = 0
notificationShadow.Parent = notification

local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, -80, 1, 0)
notificationLabel.Position = UDim2.new(0, 70, 0, 0)
notificationLabel.Text = "Script by allvesz"
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.Font = Enum.Font.GothamBold
notificationLabel.TextSize = 18
notificationLabel.BackgroundTransparency = 1
notificationLabel.TextXAlignment = Enum.TextXAlignment.Left
notificationLabel.Parent = notification

local notificationImage = Instance.new("ImageLabel")
notificationImage.Size = UDim2.new(0, 50, 0, 50)
notificationImage.Position = UDim2.new(0, 10, 0.5, -25)
notificationImage.Image = "rbxassetid://6031075938" -- Ícone do Roblox
notificationImage.BackgroundTransparency = 1
notificationImage.Parent = notification

-- Remover notificação após 3 segundos
task.delay(3, function()
    notification:Destroy()
end)

-- Criar o botão de abrir/fechar menu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.Text = "Abrir Menu"
toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui
toggleButton.Active = true
toggleButton.Draggable = true -- Botão arrastável

-- Criar o frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250) -- Centralizado
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Criar efeito de sombra para o frame principal
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.ZIndex = 0
shadow.Parent = mainFrame

-- Alternar visibilidade do menu
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Text = mainFrame.Visible and "Fechar Menu" or "Abrir Menu"
end)

-- Criar os botões laterais
local menuButtons = {"HOME", "MAIN", "ABOUT"}
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 120, 1, 0)
buttonContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
buttonContainer.BorderSizePixel = 0
buttonContainer.Parent = mainFrame

-- Criar o frame de conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, 0)
contentFrame.Position = UDim2.new(0, 120, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Criar scroll para o conteúdo (lista deslizável)
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -20)
scrollFrame.Position = UDim2.new(0, 10, 0, 10)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Será ajustado dinamicamente
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = contentFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.Parent = scrollFrame

-- Atualizar CanvasSize ao adicionar itens
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)

-- Função para limpar o conteúdo do frame
local function clearContent()
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

-- Criar os botões do menu lateral
for i, buttonText in ipairs(menuButtons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 50 + 20)
    button.Text = buttonText
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.BorderSizePixel = 0
    button.Parent = buttonContainer

    button.MouseButton1Click:Connect(function()
        clearContent()
        if buttonText == "HOME" then
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, 40)
            label.Text = "Criador: allvesz"
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.Parent = scrollFrame
        elseif buttonText == "MAIN" then
            for j = 1, 5 do
                local funcButton = Instance.new("TextButton")
                funcButton.Size = UDim2.new(1, 0, 0, 40)
                funcButton.Text = "Função " .. j
                funcButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                funcButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                funcButton.Font = Enum.Font.Gotham
                funcButton.TextSize = 14
                funcButton.Parent = scrollFrame
            end
        elseif buttonText == "ABOUT" then
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, 40)
            label.Text = "Instagram: allvesz_dz7"
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.Parent = scrollFrame
        end
    end)
end