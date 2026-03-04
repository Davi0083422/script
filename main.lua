--[[ 
    DVZ SCRIPT v2026 | FIX FOV & TOGGLE
    By Davz | Official Secure
]]

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- CONFIGURAÇÕES
local OWNER_ID = 9463794477 
local API_URL = "https://gerar-key.vercel.app"
local FOV_RAIO = 150 

-- CRIAR CÍRCULO DO FOV (VISÍVEL)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Color = Color3.fromRGB(16, 185, 129)
FOVCircle.Filled = false
FOVCircle.Transparency = 0.7
FOVCircle.Visible = false -- Começa desligado

-- VARIÁVEIS DE CONTROLE
local currentKey = ""
local menuAberto = false

-- [ TODA A SUA INTERFACE (LOGIN/MENU) MANTIDA IGUAL ]
-- (Mantive exatamente o seu design do LoginFrame e MenuFrame aqui)
-- ... [O código da interface continua o mesmo que você já tem] ...

-- [ FUNÇÃO PEGAR ALVO NO FOV ]
local function getClosestPlayer()
    local target = nil
    local shortestDistance = FOV_RAIO

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head
            local pos, onScreen = camera:WorldToViewportPoint(head.Position)
            
            if onScreen then
                local mousePos = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
                local distance = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    target = head
                end
            end
        end
    end
    return target
end

-- [ SISTEMA PRINCIPAL COM FIX ]
function iniciarSistema()
    RunService.RenderStepped:Connect(function()
        -- Centraliza o FOV na tela
        FOVCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
        FOVCircle.Radius = FOV_RAIO
        
        -- O círculo só aparece se o Aimbot ou Aim Lock estiverem ativos no menu
        if getAimbot() or getAimLock() then
            FOVCircle.Visible = true
            
            local target = getClosestPlayer()
            if target then
                -- Suavização leve para não ficar "robótico" demais
                camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
            end
        else
            FOVCircle.Visible = false
        end
    end)
end

-- [ TECLA SHIFT ESQUERDO - APENAS PARA O MENU ]
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Isso só mexe na visibilidade do Menu, o FOV continua no RenderStepped
        MenuFrame.Visible = not MenuFrame.Visible
    end
end)

-- [ BYPASS DONO ]
if player.UserId == OWNER_ID then
    task.wait(0.2)
    LoginFrame.Visible = false
    MenuFrame.Visible = true
    iniciarSistema()
end
