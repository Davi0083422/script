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

-- Barra Superior com Botão X
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 21, 26)

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 7)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Text = "DVZ SCRIPT | AUTENTICAÇÃO"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.BackgroundTransparency = 1

-- Input e Botões
local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 340, 0, 45)
KeyInput.Position = UDim2.new(0, 20, 0, 65)
KeyInput.PlaceholderText = "Awaiting System Token..."
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

local LoginBtn = Instance.new("TextButton", MainFrame)
LoginBtn.Size = UDim2.new(0, 340, 0, 45)
LoginBtn.Position = UDim2.new(0, 20, 0, 120)
LoginBtn.Text = "VALIDAR ACESSO"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold

local GetKeyBtn = Instance.new("TextButton", MainFrame)
GetKeyBtn.Size = UDim2.new(0, 340, 0, 40)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 175)
GetKeyBtn.Text = "OBTER KEY (APENAS 1 A CADA 3H)"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 36, 42)
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 170, 255)

local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Position = UDim2.new(0, 0, 1, -25)
Credits.Text = "By Davz | Official Secure"
Credits.TextColor3 = Color3.fromRGB(60, 60, 60)
Credits.BackgroundTransparency = 1

-- LÓGICA DE LOGIN
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
        -- [SUAS FUNÇÕES DE JOGO AQUI]
        
        task.delay(10800, function() -- Trava de 3 horas no script
            game.Players.LocalPlayer:Kick("Sessão de 3 horas expirou!")
        end)
    else
        LoginBtn.Text = "KEY INVÁLIDA!"
        task.wait(2)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)
