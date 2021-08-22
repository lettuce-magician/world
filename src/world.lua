---@diagnostic disable
local function WORLD()
    assert(_G.TIC == nil, "a world is arleady running")
    local game = {}
    local workspace = {}
    local controls = {}
    game.settings = {width = 240, height = 136}
    game.players = {}
    game.t = 0
    
    local function efie(fn, ...)
        if type(fn) == "function" then
            fn(...)
        end
    end
    
    function game.on(name, func)
        workspace[name] = func
    end
    
    function game.keybind(id, func)
        assert(type(id) == "number" and id >= 0 and id <= 31, "id is oob.")
        table.insert(controls, {
            button = {},
            exec = function()
                if btn(id) then
                    func()
                end
            end
        })
    end
    
    local function prs()
        for i = 0, 7 do
            if btn(i) then
                return i
            end
        end
        return -1
    end
    
    function game.run()
        efie(workspace.INIT)
        _G.TIC = function()
            cls()
            game.t = game.t + 1
            efie(workspace.UPDATE())
            if btn() ~= 0 then
                efie(workspace.BUTTON_PRESSED, prs())
            end
        end
    end
    
    function game.quit()
        efie(workspace.QUIT)
        exit()
    end
    
    return game
end

local function PLAYER(game, x, y, w, h)
    assert(#game.players <= 4, "TIC-80 only allows 4 players.")
    local player = {
        x = x or 0,
        y = y or 0,
        width = w or x,
        height = h or y,
        color = 9
    }
    
    function player.draw()
        rect (
            player.x,
            player.y,
            player.width,
            player.height,
            player.color
        )
    end
    
    table.insert(game.players, player)
    
    return player
end