-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar o frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0, 50, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cinza escuro
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.Draggable = true -- Permitir arrastar
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

-- Botão de abrir/fechar o menu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Fechar Menu"
toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui

-- Criar animação ao passar o mouse sobre o botão
toggleButton.MouseEnter:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)
toggleButton.MouseLeave:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

-- Alternar visibilidade do menu
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Text = mainFrame.Visible and "Fechar Menu" or "Abrir Menu"
end)

-- Criar os botões laterais
local menuButtons = {"HOME", "MAIN", "ABOUT", "EXTRA"} -- Botões adicionados
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 120, 1, 0)
buttonContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Cinza bem escuro
buttonContainer.BorderSizePixel = 0
buttonContainer.Parent = mainFrame

-- Criar o frame de conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, 0)
contentFrame.Position = UDim2.new(0, 120, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Label de conteúdo
local contentLabel = Instance.new("TextLabel")
contentLabel.Size = UDim2.new(1, -20, 1, -20)
contentLabel.Position = UDim2.new(0, 10, 0, 10)
contentLabel.Text = "Bem-vindo ao Menu"
contentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
contentLabel.Font = Enum.Font.Gotham
contentLabel.TextSize = 20
contentLabel.BackgroundTransparency = 1
contentLabel.Parent = contentFrame

-- Função para limpar o conteúdo do frame
local function clearContent()
    for _, child in ipairs(contentFrame:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    contentLabel.Text = ""
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

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end)

    button.MouseButton1Click:Connect(function()
        clearContent()
        if buttonText == "HOME" then
            contentLabel.Text = "Criador: allvesz"
        elseif buttonText == "MAIN" then
            local jumpButton = Instance.new("TextButton")
            jumpButton.Size = UDim2.new(0, 200, 0, 40)
            jumpButton.Position = UDim2.new(0.5, -100, 0.5, -20)
            jumpButton.Text = "Aumentar Pulo"
            jumpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            jumpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            jumpButton.Font = Enum.Font.Gotham
            jumpButton.TextSize = 14
            jumpButton.BorderSizePixel = 0
            jumpButton.Parent = contentFrame

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
        elseif buttonText == "EXTRA" then
            contentLabel.Text = "Espaço para futuras funcionalidades!"
        end
    end)
end