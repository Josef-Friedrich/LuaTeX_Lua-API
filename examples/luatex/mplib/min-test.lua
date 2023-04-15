-- https://tex.stackexchange.com/questions/23984/how-to-use-mplib-directly-from-lua

local function finder(name, mode, ftype)
    if mode == "w" then
        return name
    else
        return kpse.find_file(name, ftype)
    end
end

local inspect = require('inspect')

return function()
    local mp = mplib.new({find_file = finder, ini_version = true})
    local result = mp:execute('input plain;')
    result = mp:execute(
                 'beginfig(1); draw fullcircle scaled 20 withcolor red; endfig;')
    local t, e, l = result.term, result.error, result.log
    if result.status > 0 then
        tex.print([[Result of mplib execute is unsuccessfull.]])
    else
        if result.fig then
            print(result.fig)
            print(inspect(result.fig.charcode))
            tex.sprint('Converted something: \\vrule\\vbox{\\hrule')
            tex.sprint('\\hrule}\\vrule')
        else
            tex.print([[No figure output.]])
            tex.print([[Log:]])
            tex.print(l)
        end
    end
    mp:finish()
end
