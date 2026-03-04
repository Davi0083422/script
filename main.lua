-- DVZ SCRIPT | FIX FINAL
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("DvzScript_UI") then CoreGui:FindFirstChild("DvzScript_UI"):Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DvzScript_UI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 280)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 13, 17)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- Barra de Título
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 21, 26)
Instance.new("UICorner", TitleBar)

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Text = "DVZ SCRIPT | LOGIN"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.BackgroundTransparency = 1

-- Elementos (TextBox e Botões)
local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0, 330, 0, 45)
KeyInput.Position = UDim2.new(0.5, -165, 0, 65)
KeyInput.PlaceholderText = "Cole sua Key aqui..."
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 26, 32)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyInput)

local LoginBtn = Instance.new("TextButton", MainFrame)
LoginBtn.Size = UDim2.new(0, 330, 0, 45)
LoginBtn.Position = UDim2.new(0.5, -165, 0, 120)
LoginBtn.Text = "VALIDAR ACESSO"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", LoginBtn)

local GetKeyBtn = Instance.new("TextButton", MainFrame)
GetKeyBtn.Size = UDim2.new(0, 330, 0, 40)
GetKeyBtn.Position = UDim2.new(0.5, -165, 0, 175)
GetKeyBtn.Text = "OBTER KEY (3 HORAS)"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 36, 42)
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
Instance.new("UICorner", GetKeyBtn)

-- Lógica Simples e Funcional
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://gerar-key.vercel.app")
    GetKeyBtn.Text = "LINK COPIADO!"
    task.wait(2)
    GetKeyBtn.Text = "OBTER KEY (3 HORAS)"
end)

LoginBtn.MouseButton1Click:Connect(function()
    if string.sub(KeyInput.Text, 1, 4) == "DVZ-" and string.len(KeyInput.Text) >= 12 then [cite: 2026-03-02]
        LoginBtn.Text = "LIBERADO!"
        task.wait(1)
        MainFrame:Destroy()
        -- INSIRA O HUB DE FUNÇÕES AQUI
    else
        LoginBtn.Text = "KEY INVÁLIDA"
        task.wait(1)
        LoginBtn.Text = "VALIDAR ACESSO"
    end
end)

local Credits = Instance.new("TextLabel", MainFrame)
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Position = UDim2.new(0, 0, 1, -25)
Credits.Text = "By Davz | Pix: 24999582173" [cite: 2026-03-01, 2026-03-02]
Credits.TextColor3 = Color3.fromRGB(80, 80, 80)
Credits.BackgroundTransparency = 1
