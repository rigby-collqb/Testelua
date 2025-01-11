-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Reproduzir som curto ao iniciar
local startSound = Instance.new("Sound")
startSound.SoundId = "rbxassetid://12222005" -- Som público do Roblox
startSound.Volume = 1
startSound.Parent = screenGui
startSound:Play()

-- Notificação inicial
local notification = Instance.new("Frame")
notification.Size = UDim2.new(0, 300, 0, 100)
notification.Position = UDim2.new(0.5, -150, 0.5, -50)
notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
notification.BorderSizePixel = 0
notification.Parent = screenGui

local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, 0, 1, 0)
notificationLabel.Text = "Script by allvesz"
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.Font = Enum.Font.GothamBold
notificationLabel.TextSize = 18
notificationLabel.BackgroundTransparency = 1
notificationLabel.Parent = notification

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

-- Criar o frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250) -- Centralizado
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Alternar visibilidade do menu
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Text = mainFrame.Visible and "Fechar Menu" or "Abrir Menu"
end)

-- Criar os botões laterais e funções
local menuButtons = {"HOME", "MAIN"}
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

-- Função para limpar conteúdo
local function clearContent()
    for _, child in ipairs(contentFrame:GetChildren()) do
        child:Destroy()
    end
end

-- Criar os botões laterais
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

    -- Adicionar ações aos botões
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
            label.Parent = contentFrame
        elseif buttonText == "MAIN" then
            -- Função 1: Rejoin
            local rejoinButton = Instance.new("TextButton")
            rejoinButton.Size = UDim2.new(1, -20, 0, 40)
            rejoinButton.Text = "Rejoin Server"
            rejoinButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            rejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            rejoinButton.Font = Enum.Font.Gotham
            rejoinButton.TextSize = 14
            rejoinButton.Parent = contentFrame
            rejoinButton.MouseButton1Click:Connect(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
            end)

            -- Função 2: Aumentar Pulo
            local jumpButton = Instance.new("TextButton")
            jumpButton.Size = UDim2.new(1, -20, 0, 40)
            jumpButton.Text = "Aumentar Pulo 2x"
            jumpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            jumpButton.Font = Enum.Font.Gotham
            jumpButton.TextSize = 14
            jumpButton.Parent = contentFrame
            jumpButton.MouseButton1Click:Connect(function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.JumpPower = player.Character.Humanoid.JumpPower * 2
                end
            end)
        end
    end)
end