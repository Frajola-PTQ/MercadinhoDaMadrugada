local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remotes = ReplicatedStorage:WaitForChild("Remotes")
local welcomeEvent = remotes:WaitForChild("WelcomePlayer")

print("[Client] Cliente inicializado!")

welcomeEvent.OnClientEvent:Connect(function(message)
    print("[Client] Mensagem recebida do servidor:")
    print(message)
end)
