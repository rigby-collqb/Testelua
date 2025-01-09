-- Criando a interface do botão
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0, 100, 0, 100)
button.Text = "Tocar Música"
button.Parent = screenGui

-- Função para arrastar o botão
local dragging = false
local dragInput, dragStart, startPos

button.MouseButton1Down:Connect(function(input)
	dragging = true
	dragStart = input.Position
	startPos = button.Position

	input.Changed:Connect(function()
		if dragging then
			local delta = input.Position - dragStart
			button.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
		end
	end)
end)

button.MouseButton1Up:Connect(function()
	dragging = false
end)

-- Função para tocar o som no servidor
local function playSound()
	local soundId = "rbxassetid://12222005"
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Parent = game.Workspace

	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local soundClone = sound:Clone()
			soundClone.Parent = plr.Character:FindFirstChild("HumanoidRootPart")
			soundClone:Play()
		end
	end
end

-- Quando o botão é clicado, toca o som
button.MouseButton1Click:Connect(playSound)