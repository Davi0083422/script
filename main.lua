-- DVZ SCRIPT | RECOVERY MODE
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

-- Limpando interfaces antigas para não bugar
if CoreGui:FindFirstChild("DvzScript_UI") then
    CoreGui:FindFirstChild("DvzScript_UI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DvzScript_UI"

-- Menu de Login
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 260)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 13, 17)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- Barra de Título
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 21, 26)
TitleBar.BorderSizePixel = 0
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Text = "DVZ SCRIPT | AUTENTICAÇÃO"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.BackgroundTransparency = 1

-- Input
local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 330, 0, 40)
KeyInput.Position = UDim2.new(0.5, -165, 0, 70)
KeyInput.PlaceholderText = "Cole sua Key aqui..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyInput)

-- Botão Validar
local LoginBtn = Instance.new("TextButton", MainFrame)
LoginBtn.Size = UDim2.new(0, 330, 0, 45)
LoginBtn.Position = UDim2.new(0.5, -165, 0, 125)
LoginBtn.Text = "VALIDAR ACESSO"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", LoginBtn)

-- Lógica de Login (Local por enquanto para não dar erro de site)
LoginBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if string.sub(key, 1, 4) == "DVZ-" and string.len(key) >= 12 then [cite: 2026-03-02]
        LoginBtn.Text = "ACESSO LIBERADO!"
        task.wait(1)
        MainFrame:Visible = false
        -- Aqui abre o Hub de Aimbot/ESP
        print("Vs! Dvz Script ON.") [cite: 2026-03-02]
    else
        LoginBtn.Text = "KEY INVÁLIDA"
        task.wait(1)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)

local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Position = UDim2.new(0, 0, 1, -25)
Credits.Text = "By Davz | Official Secure" [cite: 2026-03-02]
Credits.TextColor3 = Color3.fromRGB(80, 80, 80)
Credits.BackgroundTransparency = 1
