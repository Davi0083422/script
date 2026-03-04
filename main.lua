--╔══════════════════════════════════════════════════════════════╗
--║                    DVZ SCRIPT v2026                          ║
--║              By Davz | Official Secure                       ║
--╚══════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- SEU SITE AQUI ↓↓↓
local API_URL = "https://gerar-key.vercel.app"
local OWNER_ID = 9463794477 -- Seu ID de Dono

-- VARIÁVEIS
local currentKey = ""
local sessionStart = 0
local menuAberto = false

--╔══════════════════════════════════════════════════════════════╗
--║                    TELA DE LOGIN                             ║
--╚══════════════════════════════════════════════════════════════╝

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DVZ_LOGIN"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 350, 0, 250)
LoginFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
LoginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoginFrame.BorderSizePixel = 0
LoginFrame.Parent = ScreenGui

Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 12)

-- Título
local Titulo = Instance.new("TextLabel", LoginFrame)
Titulo.Size = UDim2.new(1, 0, 0, 50)
Titulo.Position = UDim2.new(0, 0, 0, 15)
Titulo.BackgroundTransparency = 1
Titulo.Text = "🔒 DVZ SCRIPT"
Titulo.TextColor3 = Color3.fromRGB(16, 185, 129)
Titulo.TextSize = 28
Titulo.Font = Enum.Font.GothamBold

-- By Davz
local Sub = Instance.new("TextLabel", LoginFrame)
Sub.Size = UDim2.new(1, 0, 0, 20)
Sub.Position = UDim2.new(0, 0, 0, 60)
Sub.BackgroundTransparency = 1
Sub.Text = "By Davz | Official Secure"
Sub.TextColor3 = Color3.fromRGB(150, 150, 150)
Sub.TextSize = 12
Sub.Font = Enum.Font.Gotham

-- Input Key
local InputBox = Instance.new("TextBox", LoginFrame)
InputBox.Size = UDim2.new(0.8, 0, 0, 45)
InputBox.Position = UDim2.new(0.1, 0, 0, 100)
InputBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.PlaceholderText = "Digite sua Key (DVZ-XXXX)"
InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
InputBox.TextSize = 16
InputBox.Font = Enum.Font.Gotham
Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)

-- Botão Validar
local Botao = Instance.new("TextButton", LoginFrame)
Botao.Size = UDim2.new(0.8, 0, 0, 45)
Botao.Position = UDim2.new(0.1, 0, 0, 160)
Botao.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
Botao.Text = "VALIDAR KEY"
Botao.TextColor3 = Color3.fromRGB(0, 0, 0)
Botao.TextSize = 18
Botao.Font = Enum.Font.GothamBold
Instance.new("UICorner", Botao).CornerRadius = UDim.new(0, 8)

-- Status
local Status = Instance.new("TextLabel", LoginFrame)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Position = UDim2.new(0, 0, 0, 215)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 50, 50)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham

--╔══════════════════════════════════════════════════════════════╗
--║                    MENU PRINCIPAL                            ║
--╚══════════════════════════════════════════════════════════════╝

local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 280, 0, 350)
MenuFrame.Position = UDim2.new(0.5, -140, 0.5, -175)
MenuFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MenuFrame.Visible = false
MenuFrame.Parent = ScreenGui

Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 16)

-- Header verde
local Header = Instance.new("Frame", MenuFrame)
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 16)

local HeaderTitulo = Instance.new("TextLabel", Header)
HeaderTitulo.Size = UDim2.new(1, 0, 0, 40)
HeaderTitulo.Position = UDim2.new(0, 0, 0, 10)
HeaderTitulo.BackgroundTransparency = 1
HeaderTitulo.Text = "DVZ HUB"
HeaderTitulo.TextColor3 = Color3.fromRGB(0, 0, 0)
HeaderTitulo.TextSize = 24
HeaderTitulo.Font = Enum.Font.GothamBold

local Credito = Instance.new("TextLabel", Header)
Credito.Size = UDim2.new(1, 0, 0, 20)
Credito.Position = UDim2.new(0, 0, 0, 45)
Credito.BackgroundTransparency = 1
Credito.Text = "By Davz | Official Secure"
Credito.TextColor3 = Color3.fromRGB(0, 0, 0)
Credito.TextSize = 11
Credito.Font = Enum.Font.Gotham

-- Timer
local TimerLabel = Instance.new("TextLabel", MenuFrame)
TimerLabel.Size = UDim2.new(1, 0, 0, 35)
TimerLabel.Position = UDim2.new(0, 0, 0, 80)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "⏱️ 03:00:00"
TimerLabel.TextColor3 = Color3.fromRGB(16, 185, 129)
TimerLabel.TextSize = 24
TimerLabel.Font = Enum.Font.GothamBold

-- Container botões
local Container = Instance.new("Frame", MenuFrame)
Container.Size = UDim2.new(1, -40, 0, 180)
Container.Position = UDim2.new(0, 20, 0, 125)
Container.BackgroundTransparency = 1

-- Função criar botão
local function criarBotao(nome, icone, posY)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    btn.Text = icone.." "..nome
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    local ativo = false
    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        btn.BackgroundColor3 = ativo and Color3.fromRGB(16, 185, 129) or Color3.fromRGB(26, 26, 26)
        btn.TextColor3 = ativo and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        return ativo
    end)
    
    return function() return ativo end
end

-- Criar 3 botões
local getAimbot = criarBotao("AIMBOT", "🎯", 0)
local getESP = criarBotao("ESP", "👁️", 60)
local getAimLock = criarBotao("AIM LOCK", "🔒", 120)

-- Key display
local KeyDisplay = Instance.new("TextLabel", MenuFrame)
KeyDisplay.Size = UDim2.new(1, 0, 0, 20)
KeyDisplay.Position = UDim2.new(0, 0, 1, -40)
KeyDisplay.BackgroundTransparency = 1
KeyDisplay.Text = "Key: DVZ-XXXX"
KeyDisplay.TextColor3 = Color3.fromRGB(100, 100, 100)
KeyDisplay.TextSize = 12
KeyDisplay.Font = Enum.Font.Gotham

--╔══════════════════════════════════════════════════════════════╗
--║                    SISTEMA DE VALIDAÇÃO                      ║
--╚══════════════════════════════════════════════════════════════╝

Botao.MouseButton1Click:Connect(function()
    local key = InputBox.Text:upper():gsub("%s+", "")
    
    if not key:match("^DVZ%-") then
        Status.Text = "❌ Key deve começar com DVZ-"
        return
    end
    
    Status.TextColor3 = Color3.fromRGB(255, 200, 50)
    Status.Text = "⏳ Validando..."
    Botao.Text = "VALIDANDO..."
    Botao.Active = false
    
    -- Chama sua API (Ajustado sem o /api)
    local sucesso, resposta = pcall(function()
        return HttpService:RequestAsync({
            Url = API_URL.."/validate",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({
                key = key,
                roblox_user_id = player.UserId
            })
        })
    end)
    
    if not sucesso or not resposta then
        Status.Text = "❌ Erro de conexão"
        Botao.Text = "VALIDAR KEY"
        Botao.Active = true
        return
    end
    
    local dados = HttpService:JSONDecode(resposta.Body)
    
    if dados.valid then
        currentKey = key
        sessionStart = tick()
        Status.TextColor3 = Color3.fromRGB(16, 185, 129)
        Status.Text = "✅ Key validada!"
        wait(0.5)
        LoginFrame.Visible = false
        MenuFrame.Visible = true
        KeyDisplay.Text = "Key: "..key
        iniciarTimer(dados.remaining_seconds or 10800)
        iniciarSistema()
    else
        Status.TextColor3 = Color3.fromRGB(255, 50, 50)
        Status.Text = "❌ "..(dados.error or "Key inválida")
        Botao.Text = "VALIDAR KEY"
        Botao.Active = true
    end
end)

--╔══════════════════════════════════════════════════════════════╗
--║                    TIMER 3 HORAS                             ║
--╚══════════════════════════════════════════════════════════════╝

function iniciarTimer(segundosTotais)
    spawn(function()
        local tempo = segundosTotais
        while tempo > 0 and MenuFrame.Visible do
            local h = math.floor(tempo / 3600)
            local m = math.floor((tempo % 3600) / 60)
            local s = tempo % 60
            TimerLabel.Text = string.format("⏱️ %02d:%02d:%02d", h, m, s)
            if tempo < 300 then TimerLabel.TextColor3 = Color3.fromRGB(255, 200, 50) end
            wait(1)
            tempo = tempo - 1
        end
        
        -- Só dá Kick se não for o dono
        if player.UserId ~= OWNER_ID then
            TimerLabel.Text = "⏱️ EXPIRADO"
            TimerLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            wait(2)
            player:Kick("\n🔒 DVZ SCRIPT\n⏰ Sua key expirou!\n🌐 Gere nova em: gerar-key.vercel.app\n\nBy Davz")
        else
            TimerLabel.Text = "⏱️ INFINITO"
        end
    end)
end

--╔══════════════════════════════════════════════════════════════╗
--║                    FUNÇÕES (AIMBOT/ESP)                      ║
--╚══════════════════════════════════════════════════════════════╝

function iniciarSistema()
    local camera = workspace.CurrentCamera
    local espBoxes = {}
    
    RunService.RenderStepped:Connect(function()
        for _, box in pairs(espBoxes) do box:Destroy() end
        espBoxes = {}
        if getESP() then
            for _, alvo in pairs(Players:GetPlayers()) do
                if alvo ~= player and alvo.Character and alvo.Character:FindFirstChild("Head") then
                    local head = alvo.Character.Head
                    local pos, visivel = camera:WorldToViewportPoint(head.Position)
                    if visivel then
                        local box = Instance.new("TextLabel", ScreenGui)
                        box.Size = UDim2.new(0, 100, 0, 20)
                        box.Position = UDim2.new(0, pos.X - 50, 0, pos.Y - 10)
                        box.BackgroundTransparency = 1
                        box.Text = alvo.Name
                        box.TextColor3 = Color3.fromRGB(255, 0, 0)
                        box.TextSize = 14
                        box.Font = Enum.Font.GothamBold
                        table.insert(espBoxes, box)
                    end
                end
            end
        end
        if getAimbot() or getAimLock() then
            local maisProximo = nil
            local menorDist = math.huge
            for _, alvo in pairs(Players:GetPlayers()) do
                if alvo ~= player and alvo.Character and alvo.Character:FindFirstChild("Head") then
                    local head = alvo.Character.Head
                    local pos = camera:WorldToViewportPoint(head.Position)
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                    if dist < menorDist and dist < 250 then
                        menorDist = dist
                        maisProximo = head
                    end
                end
            end
            if maisProximo then camera.CFrame = CFrame.new(camera.CFrame.Position, maisProximo.Position) end
        end
    end)
end

-- LÓGICA DE BYPASS DO DONO (9463794477)
if player.UserId == OWNER_ID then
    task.wait(0.1)
    LoginFrame.Visible = false
    MenuFrame.Visible = true
    KeyDisplay.Text = "ACESSO: DONO (PERMANENTE)"
    TimerLabel.Text = "⏱️ INFINITO"
    TimerLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    iniciarSistema()
else
    print("✅ DVZ Script carregado | By Davz | gerar-key.vercel.app")
end
