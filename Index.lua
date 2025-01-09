-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar o botão
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50) -- Tamanho do botão
button.Position = UDim2.new(0.5, -100, 0.5, -25) -- Centralizado na tela
button.Text = "Aumentar Pulo"
button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde
button.Parent = screenGui

-- Variável para armazenar o estado do pulo
local jumpBoosted = false

-- Referência ao jogador e personagem
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Valor padrão de pulo
local defaultJumpPower = humanoid.JumpPower

-- Função para alternar o pulo
button.MouseButton1Click:Connect(function()
    if jumpBoosted then
        -- Voltar ao pulo normal
        humanoid.JumpPower = defaultJumpPower
        button.Text = "Aumentar Pulo"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde
    else
        -- Aumentar o pulo
        humanoid.JumpPower = defaultJumpPower * 10
        button.Text = "Reduzir Pulo"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho
    end
    jumpBoosted = not jumpBoosted
end)