-- DVZ SCRIPT - SISTEMA DE KEY REMOTA
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 300, 0, 150)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
LoginFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local Title = Instance.new("TextLabel", LoginFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Dvz Script - Sistema de Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local KeyInput = Instance.new("TextBox", LoginFrame)
KeyInput.Size = UDim2.new(0, 280, 0, 40)
KeyInput.Position = UDim2.new(0, 10, 0, 45)
KeyInput.PlaceholderText = "Cole sua Key aqui..."

local LoginBtn = Instance.new("TextButton", LoginFrame)
LoginBtn.Size = UDim2.new(0, 280, 0, 40)
LoginBtn.Position = UDim2.new(0, 10, 0, 95)
LoginBtn.Text = "Verificar Acesso"
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

-- LINK DO SEU PASTEBIN (RAW) ONDE FICA A KEY DO DIA
local KeyURL = "https://pastebin.com/raw/SEU_LINK_AQUI"

LoginBtn.MouseButton1Click:Connect(function()
    local CorrectKey = game:HttpGet(KeyURL) -- O script lê a key do site
    
    if KeyInput.Text == CorrectKey then
        print("Acesso Liberado!")
        LoginFrame:Destroy()
        -- [AQUI VOCÊ COLOCA O RESTO DO SEU SCRIPT DE AIMBOT/ESP]
        
        -- Timer de 3 Horas para fechar
        task.delay(10800, function()
            game.Players.LocalPlayer:Kick("Sua sessão de 3 horas expirou!")
        end)
    else
        LoginBtn.Text = "KEY INCORRETA!"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(2)
        LoginBtn.Text = "Verificar Acesso"
        LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)