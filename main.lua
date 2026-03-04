-- DVZ SCRIPT | HUB COMPLETO
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI DE LOGIN
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
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 330, 0, 40)
KeyInput.Position = UDim2.new(0.5, -165, 0, 70)
KeyInput.PlaceholderText = "Insira sua Key de Uso Único..."
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

-- HUB DE FUNÇÕES
function AbrirHub()
    local Hub = Instance.new("Frame", ScreenGui)
    Hub.Size = UDim2.new(0, 400, 0, 300)
    Hub.Position = UDim2.new(0.5, -200, 0.5, -150)
    Hub.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    Instance.new("UICorner", Hub)

    local function CriarBotao(txt, pos)
        local b = Instance.new("TextButton", Hub)
        b.Size = UDim2.new(0, 170, 0, 50)
        b.Position = pos
        b.Text = txt
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", b)
        return b
    end

    local Aim = CriarBotao("AIMBOT: OFF", UDim2.new(0, 20, 0, 60))
    local Esp = CriarBotao("ESP: OFF", UDim2.new(0, 210, 0, 60))
    local Lock = CriarBotao("AIM LOCK: OFF", UDim2.new(0, 20, 0, 120))
    Lock.Size = UDim2.new(0, 360, 0, 50)

    local DavzText = Instance.new("TextLabel", Hub)
    DavzText.Size = UDim2.new(1, 0, 0, 30)
    DavzText.Position = UDim2.new(0, 0, 1, -30)
    DavzText.Text = "By Davz | Official Secure" [cite: 2026-03-02]
    DavzText.BackgroundTransparency = 1
    DavzText.TextColor3 = Color3.fromRGB(80, 80, 80)
end

-- LÓGICA DE VALIDAÇÃO
LoginBtn.MouseButton1Click:Connect(function()
    if string.sub(KeyInput.Text, 1, 4) == "DVZ-" and string.len(KeyInput.Text) >= 12 then [cite: 2026-03-02]
        MainFrame:Destroy()
        AbrirHub()
        task.delay(10800, function() [cite: 2026-03-02]
            LocalPlayer:Kick("Sessão de 3 horas expirou!") [cite: 2026-03-02]
        end)
    else
        LoginBtn.Text = "KEY INVÁLIDA"
        task.wait(1)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)
