-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar o frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400) -- Tamanho do menu
mainFrame.Position = UDim2.new(0, 50, 0.5, -200) -- Posição inicial
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Cinza escuro
mainFrame.Active = true
mainFrame.Draggable = true -- Permitir arrastar
mainFrame.Parent = screenGui

-- Botão de fechar/abrir o menu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Fechar Menu"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho
toggleButton.Parent = screenGui

-- Alternar visibilidade do menu
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Text = mainFrame.Visible and "Fechar Menu" or "Abrir Menu"
end)

-- Criar os botões laterais
local menuButtons = {"HOME", "MAIN", "ABOUT"}
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 100, 1, 0)
buttonContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cinza escuro
buttonContainer.Parent = mainFrame

-- Criar o frame de conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -100, 1, 0)
contentFrame.Position = UDim2.new(0, 100, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Cinza
contentFrame.Parent = mainFrame

-- Label de conteúdo
local contentLabel = Instance.new("TextLabel")
contentLabel.Size = UDim2.new(1, -20, 1, -20)
contentLabel.Position = UDim2.new(0, 10, 0, 10)
contentLabel.Text = "Bem-vindo ao Menu"
contentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
contentLabel.BackgroundTransparency = 1
contentLabel.TextSize = 20
contentLabel.Parent = contentFrame

-- Criar os botões do menu lateral
for i, buttonText in ipairs(menuButtons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 60)
    button.Text = buttonText
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60) -- Cinza
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = buttonContainer

    button.MouseButton1Click:Connect(function()
        if buttonText == "HOME" then
            contentLabel.Text = "Criador: allvesz"
        elseif buttonText == "MAIN" then
            contentLabel.Text = ""

            -- Criar botão de aumentar pulo
            local jumpButton = Instance.new("TextButton")
            jumpButton.Size = UDim2.new(0, 200, 0, 50)
            jumpButton.Position = UDim2.new(0.5, -100, 0.5, -25)
            jumpButton.Text = "Aumentar Pulo"
            jumpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            jumpButton.Parent = contentFrame

            -- Configurar lógica do botão de pulo
            local jumpBoosted = false
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local defaultJumpPower = humanoid.JumpPower

            jumpButton.MouseButton1Click:Connect(function()
                if jumpBoosted then
                    humanoid.JumpPower = defaultJumpPower
                    jumpButton.Text = "Aumentar Pulo"
                    jumpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                else
                    humanoid.JumpPower = defaultJumpPower * 10
                    jumpButton.Text = "Reduzir Pulo"
                    jumpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                end
                jumpBoosted = not jumpBoosted
            end)
        elseif buttonText == "ABOUT" then
            contentLabel.Text = "Meu Insta: allvesz_dz7"
        end
    end)
end