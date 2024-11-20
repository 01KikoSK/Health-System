local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create HealthBar
local healthBarBackground = Instance.new("Frame")
healthBarBackground.Size = UDim2.new(0, 200, 0, 25)
healthBarBackground.Position = UDim2.new(0, 10, 0, 10)
healthBarBackground.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
healthBarBackground.Parent = screenGui

local healthBar = Instance.new("Frame")
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.Position = UDim2.new(0, 0, 0, 0)
healthBar.BackgroundColor3 = Color3.new(0, 1, 0)
healthBar.Parent = healthBarBackground

-- Create HealthText
local healthText = Instance.new("TextLabel")
healthText.Size = UDim2.new(1, 0, 1, 0)
healthText.Position = UDim2.new(0, 0, 0, 0)
healthText.BackgroundTransparency = 1
healthText.TextColor3 = Color3.new(1, 1, 1)
healthText.TextScaled = true
healthText.Parent = healthBarBackground

-- Function to update health display
local function updateHealthDisplay(health)
	healthBar.Size = UDim2.new(health / 100, 0, 1, 0)
	healthText.Text = "Health: " .. tostring(health) .. "%"
end

-- Initialize health
local health = 100
updateHealthDisplay(health)

-- Function to damage player
local function damagePlayer(damage)
	health = math.max(0, health - damage)
	updateHealthDisplay(health)
	if health <= 0 then
		print("Player is dead")
		-- Handle player death (respawn, etc.)
	end
end

-- Function to heal player
local function healPlayer(amount)
	health = math.min(100, health + amount)
	updateHealthDisplay(health)
end

-- Example: Damage player every 5 seconds by 10 health points
while true do
	wait(5)
	damagePlayer(10)
end

-- Example: Heal player by 20 health points after 20 seconds
wait(20)
healPlayer(20)
