--// SERVICIOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// TOOL
local tool = Instance.new("Tool")
tool.Name = " Ghost"
tool.RequiresHandle = true
tool.TextureId = "rbxassetid://100805314398190"

--// HANDLE
local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(4,1,2)
handle.Transparency = 1
handle.CanCollide = false
handle.Material = Enum.Material.Plastic
handle.Color = Color3.fromRGB(163,162,165)
handle.Parent = tool

--// FUNCION BASE
local function makePart(name, size, color, offset, transparency, texture)
	local p = Instance.new("Part")
	p.Name = name
	p.Size = Vector3.new(size[1], size[2], size[3])
	p.Color = Color3.new(color[1], color[2], color[3])
	p.Material = Enum.Material.Plastic
	p.CanCollide = false
	p.Anchored = false
	p.Transparency = transparency
	p.Parent = tool

	p.CFrame = handle.CFrame * CFrame.new(offset[1], offset[2], offset[3])

	-- DECAL (cara)
	if texture then
		local d = Instance.new("Decal")
		d.Texture = texture
		d.Face = Enum.NormalId.Front
		d.Parent = p
	end

	-- 🔥 MESH SOLO PARA HEAD
	if name == "Head" then
		local mesh = Instance.new("SpecialMesh")
		mesh.Scale = Vector3.new(1.25,1.25,1.25)
		mesh.Parent = p
	end

	local w = Instance.new("WeldConstraint")
	w.Part0 = handle
	w.Part1 = p
	w.Parent = p

	return p
end

-- PARTES (GHOST)
makePart("Head", {0.6,0.3,0.3}, {0.498,0.498,0.498}, {0,0.85,0}, 0.6, "rbxasset://textures/face.png")
makePart("Torso", {0.6,0.6,0.3}, {0.498,0.498,0.498}, {0,0.4,0}, 0.6)
makePart("Left Arm", {0.3,0.6,0.3}, {0.498,0.498,0.498}, {-0.45,0.4,0}, 0.6)
makePart("Right Arm", {0.3,0.6,0.3}, {0.498,0.498,0.498}, {0.45,0.4,0}, 0.6)
makePart("Left Leg", {0.3,0.6,0.3}, {0.498,0.498,0.498}, {-0.15,-0.2,0}, 0.6)
makePart("Right Leg", {0.3,0.6,0.3}, {0.498,0.498,0.498}, {0.15,-0.2,0}, 0.6)
makePart("HumanoidRootPart", {0.6,0.6,0.3}, {0.639,0.635,0.647}, {0,0.4,0}, 0.6)

--// DAR TOOL
tool.Parent = player:WaitForChild("Backpack")
