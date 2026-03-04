--╔══════════════════════════════════════════════════════════════╗
--║                    DVZ SCRIPT v2026                          ║
--║              By Davz | Official Secure                       ║
--╚══════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- CONFIGURAÇÕES
local OWNER_ID = 9463794477 
local API_URL = "https://gerar-key.vercel.app"
local FOV_RAIO = 150 -- Tamanho do círculo do Aimbot (pode aumentar se quiser)

-- VARIÁVEIS
local currentKey = ""
local menuVisivel = false

-- CIRCULO DO FOV (Invisível por padrão, mas limita o Aimbot)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Color = Color3.fromRGB(16, 185, 129)
FOVCircle.Filled = false
FOVCircle.Transparency = 0.5
FOVCircle.Visible = false -- Mude para true se quiser ver o círculo na tela

-- [ TELA DE LOGIN & MENU - MANTIDOS IGUAIS ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DVZ_LOGIN"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 350, 0, 250)
LoginFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
LoginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoginFrame.Parent = ScreenGui
Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 12)

local Titulo = Instance.new("TextLabel", LoginFrame)
Titulo.Size, Titulo.Position = UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, 15)
Titulo.BackgroundTransparency, Titulo.Text, Titulo.TextColor3 = 1, "🔒 DVZ SCRIPT", Color3.fromRGB(16, 185, 129)
Titulo.TextSize, Titulo.Font = 28, Enum.Font.GothamBold

local InputBox = Instance.new("TextBox", LoginFrame)
InputBox.Size, InputBox.Position = UDim2.new(0.8, 0, 0, 45), UDim2.new(0.1, 0, 0, 100)
InputBox.BackgroundColor3, InputBox.PlaceholderText = Color3.fromRGB(26, 26, 26), "Digite sua Key (DVZ-XXXX)"
InputBox.TextColor3, InputBox.TextSize = Color3.fromRGB(255, 255, 255), 16
Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)

local Botao = Instance.new("TextButton", LoginFrame)
Botao.Size, Botao.Position = UDim2.new(0.8, 0, 0, 45), UDim2.new(0.1, 0, 0, 160)
Botao.BackgroundColor3, Botao.Text = Color3.fromRGB(16, 185, 129), "VALIDAR KEY"
Botao.Font, Botao.TextSize = Enum.Font.GothamBold, 18
Instance.new("UICorner", Botao).CornerRadius = UDim.new(0, 8)

local MenuFrame = Instance.new("Frame")
MenuFrame.Size, MenuFrame.Position = UDim2.new(0, 280, 0, 350), UDim2.new(0.5, -140, 0.5, -175)
MenuFrame.BackgroundColor3, MenuFrame.Visible = Color3.fromRGB(10, 10, 10), false
MenuFrame.Parent = ScreenGui
Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 16)

local Header = Instance.new("Frame", MenuFrame)
Header.Size, Header.BackgroundColor3 = UDim2.new(1, 0, 0, 70), Color3.fromRGB(16, 185, 129)
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 16)

local TimerLabel = Instance.new("TextLabel", MenuFrame)
TimerLabel.Size, TimerLabel.Position = UDim2.new(1, 0, 0, 35), UDim2.new(0, 0, 0, 80)
TimerLabel.BackgroundTransparency, TimerLabel.Text, TimerLabel.TextSize = 1, "⏱️ 03:00:00", 24
TimerLabel.TextColor3, TimerLabel.Font = Color3.fromRGB(16, 185, 129), Enum.Font.GothamBold

local Container = Instance.new("Frame", MenuFrame)
Container.Size, Container.Position = UDim2.new(1, -40, 0, 180), UDim2.new(0, 20, 0, 125)
Container.BackgroundTransparency = 1

local function criarBotao(nome, icone, posY)
    local btn = Instance.new("TextButton", Container)
    btn.Size, btn.Position = UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, posY)
    btn.BackgroundColor3, btn.Text = Color3.fromRGB(26, 26, 26), icone.." "..nome
    btn.TextColor3, btn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    local ativo = false
    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        btn.BackgroundColor3 = ativo and Color3.fromRGB(16, 185, 129) or Color3.fromRGB(26, 26, 26)
        btn.TextColor3 = ativo and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    end)
    return function() return ativo end
end

local getAimbot = criarBotao("AIMBOT", "🎯", 0)
local getESP = criarBotao("ESP", "👁️", 60)
local getAimLock = criarBotao("AIM LOCK", "🔒", 120)

-- [ FUNÇÃO PEGAR ALVO MAIS PRÓXIMO DO MEIO DA TELA ]
local function getClosestPlayer()
    local target = nil
    local shortestDistance = FOV_RAIO

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local pos, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    target = v.Character.Head
                end
            end
        end
    end
    return target
end

-- [ SISTEMA PRINCIPAL ]
function iniciarSistema()
    RunService.RenderStepped:Connect(function()
        -- Atualiza Círculo de FOV
        FOVCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
        FOVCircle.Radius = FOV_RAIO
        
        -- AIMBOT LOGIC
        if getAimbot() or getAimLock() then
            local target = getClosestPlayer()
            if target then
                camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
            end
        end
    end)
end

-- [ TECLA SHIFT ESQUERDO ]
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        MenuFrame.Visible = not MenuFrame.Visible
        FOVCircle.Visible = MenuFrame.Visible -- Círculo aparece quando abre o menu
    end
end)

-- [ VALIDAÇÃO E BYPASS ]
Botao.MouseButton1Click:Connect(function()
    local key = InputBox.Text:upper():gsub("%s+", "")
    if key:match("^DVZ%-") then
        local sucesso, resposta = pcall(function()
            return HttpService:RequestAsync({
                Url = API_URL.."/validate",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({key = key, roblox_user_id = player.UserId})
            })
        end)
        if sucesso and HttpService:JSONDecode(resposta.Body).valid then
            currentKey = key
            LoginFrame.Visible, MenuFrame.Visible = false, true
            iniciarSistema()
        end
    end
end)

if player.UserId == OWNER_ID then
    task.wait(0.2)
    LoginFrame.Visible, MenuFrame.Visible = false, true
    iniciarSistema()
end
