-- [[ TEIA HUB - SCRIPT 1: SISTEMA DE LOGIN / KEY ]]

local KeyCorreta = "2010"
-- COLE AQUI O LINK DO SEU REPOSITÓRIO ONDE ESTÁ O SCRIPT 2 (Ex: GitHub Raw ou Pastebin Raw):
local URL_SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/legityt252-cloud/Like3/refs/heads/main/Teia%20HUB.lua"

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/legityt252-cloud/Like3/refs/heads/main/Teia%20HUB.lua"))()

-- Janela de Autenticação Clean
local KeyWindow = Fluent:CreateWindow({
    Title = "🕷️ TEIA HUB",
    SubTitle = "Sistema de Login & Autenticação",
    TabWidth = 140,
    Size = UDim2.fromOffset(450, 260),
    Acrylic = false,
    Theme = "Dark"
})

local KeyTab = KeyWindow:AddTab({ Title = "Login", Icon = "key" })

local InputKey = ""

KeyTab:AddInput("KeyInput", {
    Title = "Chave de Acesso (Key):",
    Default = "",
    Placeholder = "Digite a Key aqui...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        InputKey = Value
    end
})

KeyTab:AddButton({
    Title = "🔓 Entrar no Teia HUB",
    Description = "Valida a Key e baixa a versão mais recente do Hub",
    Callback = function()
        if InputKey == KeyCorreta then
            Fluent:Notify({ Title = "Teia HUB", Content = "Key Aprovada! Baixando menu...", Duration = 3 })
            task.wait(1)
            KeyWindow:Destroy() -- Destrói a tela de login completamente
            
            -- Baixa e executa o Script 2 (Teia HUB Principal) do seu repositório
            task.spawn(function()
                local success, err = pcall(function()
                    loadstring(game:HttpGet(URL_SCRIPT_PRINCIPAL))()
                end)
                if not success then
                    warn("Erro ao carregar Teia HUB Principal:", err)
                end
            end)
        else
            Fluent:Notify({ Title = "Teia HUB", Content = "Key Incorreta! Tente novamente.", Duration = 3 })
        end
    end
})

KeyWindow:SelectTab(1)
