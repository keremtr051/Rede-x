local HtType = true

local InsertService = game:GetService'InsertService'
local LoadAsset = InsertService.LoadLocalAsset
local getrawmetatable = getrawmetatable
local TableRemove = table.remove
local TableInsert = table.insert
local unpack = unpack
local GameMeta = getrawmetatable(game)
setreadonly(GameMeta, false)
local GameIndex = GameMeta.__index
local GameNamecall = GameMeta.__namecall
local GameToString = GameMeta.__tostring

--drawing API
local GetRP = getrenderproperty
local SetRP = setrenderproperty
local CreateRP = createrenderobject
local DestroyRP = destroyrenderobject

local LineMT =
{
    __index = function(T, K)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Remove" then return newcclosure(function() DestroyRP(rawget(T, "__OBJECT")) rawset(T, "__OBJECT", nil) rawset(T, "__OBJECT_EXISTS", false) end) end

        return GetRP(rawget(T, "__OBJECT"), K)
    end,

    __newindex = function(T, K, V)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Visible" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Visible', expected boolean") end
        if K == "From" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'From', expected Vector2") end
        if K == "To" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'To', expected Vector2") end
        if K == "Color" and typeof(V) ~= "Color3" then error("invalid type '" .. typeof(V) .. "' for property 'Color', expected Color3") end
        if K == "Thickness" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Thickness', expected number") end
        if K == "Transparency" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Transparency', expected number") end

        return SetRP(rawget(T, "__OBJECT"), K, V)
    end,

    __type = "Line"
}

local TextMT = 
{
    __index = function(T, K)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Remove" then return newcclosure(function() DestroyRP(rawget(T, "__OBJECT")) rawset(T, "__OBJECT", nil) rawset(T, "__OBJECT_EXISTS", false) end) end

        return GetRP(rawget(T, "__OBJECT"), K)
    end,

    __newindex = function(T, K, V)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Visible" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Visible', expected boolean") end
        if K == "Text" and type(V) ~= "string" then error("invalid type '" .. typeof(V) .. "' for property 'Text', expected string") end
        if K == "Position" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'Position', expected Vector2") end
        if K == "Color" and typeof(V) ~= "Color3" then error("invalid type '" .. typeof(V) .. "' for property 'Color', expected Color3") end
        if K == "Center" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Center', expected boolean") end
        if K == "Outline" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Outline', expected boolean") end
        if K == "OutlineColor" and typeof(V) ~= "Color3" then error("invalid type '" .. typeof(V) .. "' for property 'OutlineColor', expected Color3") end
		if K == "Size" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Size', expected number") end
        if K == "Font" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Font', expected number") end
        if K == "Font" and (V < 0 or V > 3) then error("invalid font") end
        if K == "Transparency" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Transparency', expected number") end

        return SetRP(rawget(T, "__OBJECT"), K, V)
    end,

    __type = "Text"
}

local SquareMT = 
{
    __index = function(T, K)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Remove" then return newcclosure(function() DestroyRP(rawget(T, "__OBJECT")) rawset(T, "__OBJECT", nil) rawset(T, "__OBJECT_EXISTS", false) end) end

        return GetRP(rawget(T, "__OBJECT"), K)
    end,

    __newindex = function(T, K, V)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Visible" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Visible', expected boolean") end
        if K == "Position" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'Position', expected Vector2") end
        if K == "Size" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'Size', expected Vector2") end
        if K == "Color" and typeof(V) ~= "Color3" then error("invalid type '" .. typeof(V) .. "' for property 'Color', expected Color3") end
        if K == "Thickness" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Thickness', expected number") end
        if K == "Filled" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Filled', expected boolean") end
        if K == "Transparency" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Transparency', expected number") end

        return SetRP(rawget(T, "__OBJECT"), K, V)
    end,

    __type = "Square"
}

local CircleMT = 
{
    __index = function(T, K)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Remove" then return newcclosure(function() DestroyRP(rawget(T, "__OBJECT")) rawset(T, "__OBJECT", nil) rawset(T, "__OBJECT_EXISTS", false) end) end

        return GetRP(rawget(T, "__OBJECT"), K)
    end,

    __newindex = function(T, K, V)
        if not rawget(T, "__OBJECT_EXISTS") then error("render object destroyed") end

        if K == "Visible" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Visible', expected boolean") end
        if K == "Position" and typeof(V) ~= "Vector2" then error("invalid type '" .. typeof(V) .. "' for property 'Position', expected Vector2") end
        if K == "Radius" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Radius', expected number") end
        if K == "Color" and typeof(V) ~= "Color3" then error("invalid type '" .. typeof(V) .. "' for property 'Color', expected Color3") end
        if K == "Thickness" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Thickness', expected number") end
        if K == "Filled" and type(V) ~= "boolean" then error("invalid type '" .. typeof(V) .. "' for property 'Filled', expected boolean") end
        if K == "Transparency" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'Transparency', expected number") end
        if K == "NumSides" and type(V) ~= "number" then error("invalid type '" .. typeof(V) .. "' for property 'NumSides', expected number") end

        return SetRP(rawget(T, "__OBJECT"), K, V)
    end,

    __type = "Circle"
}

local RPInit = false

local Draw =
{
    new = function(Type)
        if Type == "Line" then
            local RendObj = CreateRP(Type)
            if not RPInit then wait(0.1) RPInit = true end

            local Ret = 
            {
                __OBJECT = RendObj,
                __OBJECT_EXISTS = true
            }

            return setmetatable(Ret, LineMT)
        end

        if Type == "Text" then
            local RendObj = CreateRP(Type)
            if not RPInit then wait(0.1) RPInit = true end

            local Ret = 
            {
                __OBJECT = RendObj,
                __OBJECT_EXISTS = true
            }

            return setmetatable(Ret, TextMT)
        end

        if Type == "Square" then
            local RendObj = CreateRP(Type)
            if not RPInit then wait(0.1) RPInit = true end

            local Ret = 
            {
                __OBJECT = RendObj,
                __OBJECT_EXISTS = true
            }

            return setmetatable(Ret, SquareMT)
        end

        if Type == "Circle" then
            local RendObj = CreateRP(Type)
            if not RPInit then wait(0.1) RPInit = true end

            local Ret = 
            {
                __OBJECT = RendObj,
                __OBJECT_EXISTS = true
            }

            return setmetatable(Ret, CircleMT)
        end

        error("invalid object type ('" .. tostring(Type) .. "')")
    end,

    Fonts =
    {
        UI = 0,
        System = 1,
        Plex = 2,
        Monospace = 3
    }
}
getgenv().Drawing = Draw
getgenv().getrenderproperty = nil
getgenv().setrenderproperty = nil
getgenv().createrenderobject = nil
getgenv().destroyrenderobject = nil
