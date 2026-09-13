-- [[ TEIA HUB - SCRIPT 1: LOGIN (CREDENCIAIS OFUSCADAS) ]]

-- Credenciais e URL protegidas
local _k = string.char(50, 48, 49, 48) -- "2010"
local _u = "https://" .. "raw.githubusercontent.com/" .. "Legityt252/02/" .. "refs/heads/main/" .. "Lua.lua"

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local KeyWindow = Fluent:CreateWindow({
    Title = "TEIA HUB",
    SubTitle = "Sistema de Login",
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
    Title = "Entrar no Teia HUB",
    Description = "Valida a Key",
    Callback = function()
        if InputKey == _k then
            Fluent:Notify({ Title = "Teia HUB", Content = "Key Aprovada! Baixando menu...", Duration = 3 })
            task.wait(1)
            KeyWindow:Destroy()
            
            task.spawn(function()
                local success, err = pcall(function()
                    loadstring(game:HttpGet(_u))()
                end)
                if not success then
                    warn("Erro ao carregar Teia HUB Principal:", err)
                end
            end)
        else
            Fluent:Notify({ Title = "Teia HUB", Content = "Key Incorreta!", Duration = 3 })
        end
    end
})

KeyWindow:SelectTab(1)
