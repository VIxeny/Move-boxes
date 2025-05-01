local Class = {}

function Class:new()
    local newClass = {}
    local class_mt = { __index = newClass }

    function newClass:new(...)
        local instance = {}
        setmetatable(instance, class_mt)


        if self.init then
            self.init(instance, ...)
        end

        return instance
    end

    function newClass:extends(parentClass)
        setmetatable(newClass, { __index = parentClass })
        return newClass
    end

    return newClass
end

