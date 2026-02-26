repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =========================
-- TOGGLE ÚNICO (GUI 6)
-- =========================
if _G.GearActivatorGUI_6 then
	_G.GearActivatorGUI_6:Destroy()
	_G.GearActivatorGUI_6 = nil
	return
end

-- Crear ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "GearActivatorGUI_6"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
_G.GearActivatorGUI_6 = gui

-- Crear Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0.5, -125, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Active = true
frame.Draggable = true

-- Texto
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 30)
label.Position = UDim2.new(0, 10, 0, 10)
label.Text = "SPAWN CLONE"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextScaled = true
label.Parent = frame

-- TextBox
local textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(1, -20, 0, 30)
textbox.Position = UDim2.new(0, 10, 0, 45)
textbox.PlaceholderText = ""
textbox.Text = ""
textbox.ClearTextOnFocus = false
textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
textbox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
textbox.Parent = frame

-- Botón
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 80)
button.Text = "Activar"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.Parent = frame

-- Función botón
button.MouseButton1Click:Connect(function()
	local value = tonumber(textbox.Text)
	if value then
		for i = 1, value do
			local args = {[1] = "Decoy"}
			game:GetService("ReplicatedStorage").ActivateGear:FireServer(unpack(args))
		end
	end
end)
