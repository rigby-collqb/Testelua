-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Reproduzir som curto ao iniciar
local startSound = Instance.new("Sound")
startSound.SoundId = "rbxassetid://6954025463" -- Substitua pelo ID do som desejado
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

-- Criar botão de abrir/fechar menu, frame principal e menu lateral
-- [O resto do código principal permanece igual, exceto a parte das funções MAIN]

-- Adicionar botões nas funções MAIN
if buttonText == "MAIN" then
    for j = 1, 5 do
        local funcButton = Instance.new("TextButton")
        funcButton.Size = UDim2.new(1, 0, 0, 40)
        funcButton.Text = "Função " .. j
        funcButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        funcButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        funcButton.Font = Enum.Font.Gotham
        funcButton.TextSize = 14
        funcButton.Parent = scrollFrame

        -- Adicionar funções específicas aos botões
        if j == 1 then
            funcButton.Text = "Rejoin Server"
            funcButton.MouseButton1Click:Connect(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
            end)
        elseif j == 2 then
            funcButton.Text = "Aumentar Pulo 2x"
            funcButton.MouseButton1Click:Connect(function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.JumpPower = player.Character.Humanoid.JumpPower * 2
                end
            end)
        end
    end
end