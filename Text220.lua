-- ======================
-- DUPLICADOR DE DECOY
-- ======================
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local decoyName = "Decoy"

local function duplicateTool(num)
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local original = backpack:FindFirstChild(decoyName)
    if not original then return end

    for i = 1, num do
        local clone = original:Clone()
        clone.Parent = backpack
        humanoid:EquipTool(clone)
        task.wait(0.1)
        clone:Activate()
        task.wait(0.1)
        clone:Destroy()
    end
end

-- GUI
local PlayerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "DecoyDuplicatorGUI"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 250, 0, 120)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Decoy Duplicator"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

local textBox = Instance.new("TextBox", mainFrame)
textBox.Size = UDim2.new(0, 200, 0, 30)
textBox.Position = UDim2.new(0, 25, 0, 40)
textBox.PlaceholderText = "Cantidad de Decoy"
textBox.Text = "1"
textBox.ClearTextOnFocus = false
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Font = Enum.Font.Gotham
textBox.TextScaled = true
textBox.BorderSizePixel = 0

local activateButton = Instance.new("TextButton", mainFrame)
activateButton.Size = UDim2.new(0, 200, 0, 30)
activateButton.Position = UDim2.new(0, 25, 0, 80)
activateButton.Text = "Activar"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
activateButton.Font = Enum.Font.GothamBold
activateButton.TextScaled = true
activateButton.BorderSizePixel = 0

activateButton.MouseButton1Click:Connect(function()
    local num = tonumber(textBox.Text) or 1
    if num > 0 then
        duplicateTool(num)
    end
end)

-- Reaparecer si mueres
player.CharacterAdded:Connect(function()
    task.wait(1)
end)
