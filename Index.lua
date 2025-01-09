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
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
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

-- Função para animar abertura/fechamento do menu
local function toggleMenu()
    if mainFrame.Visible then
        for i = 1, 10 do
            mainFrame.Size = UDim2.new(0, 400 - (40 * i), 0, 500 - (50 * i))
            mainFrame.Position = UDim2.new(0.5, -mainFrame.Size.X.Offset / 2, 0.5, -mainFrame.Size.Y.Offset / 2)
            task.wait(0.02)
        end
        mainFrame.Visible = false
    else
        mainFrame.Visible = true
        for i = 1, 10 do
            mainFrame.Size = UDim2.new(0, 40 * i, 0, 50 * i)
            mainFrame.Position = UDim2.new(0.5, -mainFrame.Size.X.Offset / 2, 0.5, -mainFrame.Size.Y.Offset / 2)
            task.wait(0.02)
        end
    end
end

toggleButton.MouseButton1Click:Connect(toggleMenu)

-- Botões laterais
local menuButtons = {"HOME", "MAIN", "ABOUT"}
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 120, 1, 0)
buttonContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
buttonContainer.BorderSizePixel = 0
buttonContainer.Parent = mainFrame

-- Conteúdo do menu
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, 0)
contentFrame.Position = UDim2.new(0, 120, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Adicionar funções no MAIN
local function addFunction(name, callback)
    local funcButton = Instance.new("TextButton")
    funcButton.Size = UDim2.new(1, 0, 0, 40)
    funcButton.Text = name
    funcButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    funcButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    funcButton.Font = Enum.Font.Gotham
    funcButton.TextSize = 14
    funcButton.Parent = contentFrame
    funcButton.MouseButton1Click:Connect(callback)
end

-- Função: Aumentar pulo
addFunction("Aumentar Pulo", function()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = humanoid.JumpPower + 50
    end
end)

-- Função: Aumentar velocidade
addFunction("Aumentar Velocidade", function()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = humanoid.WalkSpeed + 20
    end
end)

-- Função: Puxar carro
addFunction("Puxar Carro", function()
    for _, v in ipairs(workspace.Vehicles:GetChildren()) do
        if v:IsA("Model") then
            v:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(5, 0, 0))
            break
        end
    end
end)