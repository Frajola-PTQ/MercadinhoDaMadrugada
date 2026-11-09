local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(
    ReplicatedStorage:WaitForChild("Shared"):WaitForChild("GameConfig")
)

local remotes = ReplicatedStorage:FindFirstChild("Remotes")

if not remotes then
    remotes = Instance.new("Folder")
    remotes.Name = "Remotes"
    remotes.Parent = ReplicatedStorage
end

local welcomeEvent = remotes:FindFirstChild("WelcomePlayer")

if not welcomeEvent then
    welcomeEvent = Instance.new("RemoteEvent")
    welcomeEvent.Name = "WelcomePlayer"
    welcomeEvent.Parent = remotes
end

print("================================")
print(GameConfig.StudioName)
print(GameConfig.GameName)
print("Versão:", GameConfig.Version)
print("[Server] Servidor inicializado!")

local function onPlayerAdded(player)
    print("[Server] Jogador conectado:", player.Name)

    task.wait(2)
    welcomeEvent:FireClient(player, "Bem-vindo ao Mercadinho da Madrugada!")
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in Players:GetPlayers() do
    task.spawn(onPlayerAdded, player)
end

print("================================")
