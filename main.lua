-- DVZ SCRIPT | LOGIN + HUB DE FUNÇÕES
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [SISTEMA DE LOGIN]
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 260)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 13, 17)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 21, 26)
TitleBar.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Text = "DVZ SCRIPT | AUTENTICAÇÃO"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.BackgroundTransparency = 1

local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 330, 0, 40)
KeyInput.Position = UDim2.new(0.5, -165, 0, 70)
KeyInput.PlaceholderText = "Awaiting Token..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyInput)

local LoginBtn = Instance.new("TextButton", MainFrame)
LoginBtn.Size = UDim2.new(0, 330, 0, 45)
LoginBtn.Position = UDim2.new(0.5, -165, 0, 125)
LoginBtn.Text = "VALIDAR ACESSO"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", LoginBtn)

-- [FUNÇÃO QUE ABRE O HUB APÓS O LOGIN]
function OpenDvzHub()
    local HubFrame = Instance.new("Frame", ScreenGui)
    HubFrame.Size = UDim2.new(0, 400, 0, 300)
    HubFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    HubFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", HubFrame)
    
    local HubTitle = Instance.new("TextLabel", HubFrame)
    HubTitle.Size = UDim2.new(1, 0, 0, 40)
    HubTitle.Text = "DVZ SCRIPT | MAIN HUB"
    HubTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    HubTitle.TextColor3 = Color3.fromRGB(0, 200, 120)
    HubTitle.Font = Enum.Font.GothamBold

    -- BOTÃO AIMBOT
    local AimBtn = Instance.new("TextButton", HubFrame)
    AimBtn.Size = UDim2.new(0, 170, 0, 50)
    AimBtn.Position = UDim2.new(0, 20, 0, 60)
    AimBtn.Text = "AIMBOT: OFF"
    AimBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    AimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", AimBtn)

    -- BOTÃO ESP
    local EspBtn = Instance.new("TextButton", HubFrame)
    EspBtn.Size = UDim2.new(0, 170, 0, 50)
    EspBtn.Position = UDim2.new(0, 210, 0, 60)
    EspBtn.Text = "ESP: OFF"
    EspBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", EspBtn)

    -- BOTÃO AIM LOCK
    local LockBtn = Instance.new("TextButton", HubFrame)
    LockBtn.Size = UDim2.new(0, 360, 0, 50)
    LockBtn.Position = UDim2.new(0, 20, 0, 130)
    LockBtn.Text = "AIM LOCK: OFF"
    LockBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    LockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", LockBtn)

    local Footer = Instance.new("TextLabel", HubFrame)
    Footer.Size = UDim2.new(1, 0, 0, 30)
    Footer.Position = UDim2.new(0, 0, 1, -30)
    Footer.Text = "Credits by Davz | Official Secure" [cite: 2026-03-02]
    Footer.TextColor3 = Color3.fromRGB(100, 100, 100)
    Footer.BackgroundTransparency = 1

    -- Lógica Simples (Apenas visual, aqui você insere seus scripts de cheat)
    AimBtn.MouseButton1Click:Connect(function()
        AimBtn.Text = (AimBtn.Text == "AIMBOT: OFF") and "AIMBOT: ON" or "AIMBOT: OFF"
        AimBtn.TextColor3 = (AimBtn.Text == "AIMBOT: ON") and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    end)
end

-- [VALIDAÇÃO DO LOGIN]
LoginBtn.MouseButton1Click:Connect(function()
    if string.sub(KeyInput.Text, 1, 4) == "DVZ-" and string.len(KeyInput.Text) >= 12 then [cite: 2026-03-02]
        MainFrame:Destroy()
        OpenDvzHub()
        
        task.delay(10800, function() [cite: 2026-03-02]
            LocalPlayer:Kick("Sessão de 3 horas expirou!") [cite: 2026-03-02]
        end)
    else
        LoginBtn.Text = "KEY INVÁLIDA"
        task.wait(2)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)
