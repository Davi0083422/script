-- DVZ SCRIPT | PREMIUM LOGIN SYSTEM
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 260)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 13, 17)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Barra Superior (Corrigida)
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

-- Botão X (Posicionamento Fino)
local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Campo de Input (Limpando o "TextBox" que aparecia)
local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 330, 0, 40)
KeyInput.Position = UDim2.new(0.5, -165, 0, 65)
KeyInput.PlaceholderText = "Awaiting System Token..."
KeyInput.Text = "" -- Deixando vazio para não bugar
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14

local KeyCorner = Instance.new("UICorner", KeyInput)

-- Botão Validar (Centralizado)
local LoginBtn = Instance.new("TextButton", MainFrame)
LoginBtn.Size = UDim2.new(0, 330, 0, 45)
LoginBtn.Position = UDim2.new(0.5, -165, 0, 120)
LoginBtn.Text = "VALIDAR ACESSO"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.TextSize = 14

local LoginCorner = Instance.new("UICorner", LoginBtn)

-- Botão Get Key
local GetKeyBtn = Instance.new("TextButton", MainFrame)
GetKeyBtn.Size = UDim2.new(0, 330, 0, 40)
GetKeyBtn.Position = UDim2.new(0.5, -165, 0, 180)
GetKeyBtn.Text = "OBTER KEY (APENAS 1 A CADA 3H)"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 36, 42)
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
GetKeyBtn.Font = Enum.Font.Gotham
GetKeyBtn.TextSize = 12

local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)

-- Créditos (By Davz)
local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Position = UDim2.new(0, 0, 1, -25)
Credits.Text = "By Davz | Official Secure"
Credits.TextColor3 = Color3.fromRGB(60, 60, 60)
Credits.BackgroundTransparency = 1
Credits.Font = Enum.Font.Gotham
Credits.TextSize = 12

-- LÓGICA DE FUNCIONAMENTO
local MEU_SITE = "https://gerar-key.vercel.app"

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(MEU_SITE)
    GetKeyBtn.Text = "LINK COPIADO!"
    task.wait(2)
    GetKeyBtn.Text = "OBTER KEY (APENAS 1 A CADA 3H)"
end)

LoginBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    if string.sub(input, 1, 4) == "DVZ-" and string.len(input) >= 12 then
        LoginBtn.Text = "ACESSO LIBERADO!"
        task.wait(1)
        ScreenGui:Destroy()
        -- INSIRA SEU SCRIPT DE JOGO ABAIXO
        print("Dvz Script Iniciado.")
        
        task.delay(10800, function()
            game.Players.LocalPlayer:Kick("Sessão de 3 horas expirou!")
        end)
    else
        LoginBtn.Text = "KEY INVÁLIDA!"
        task.wait(2)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)
