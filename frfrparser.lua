--[[

FrenchFries Programming Language Parser

Made by NicePotato

]]--

local parser = {}

parser._VERSION = 1

local escapeList = {
    ['\\\\'] = '\\',
    ['\\"'] = '"',
    ["\\'"] = "'",
    ["\\n"] = "\n",
    ["\\r"] = "\r",
    ["\\t"] = "\t",
    ["\\v"] = "\v",
    ["\\0"] = "\0"
}

function parser.parse(lex)
    local retTokens = {}
    local retTypes = {}
    local retPos = {}
    local mlex = {
        tokens = {},
        types = {},
        pos = {}
    }
    -- Obliteration (removed useless)
    local ni = 1
    for i=1,#lex.pos do
        if lex.types[i] == "whitespace" then
            mlex.tokens[ni] = lex.tokens[i]:strip
            mlex.types[ni] = lex.types[i]
            mlex.pos[ni] = lex.pos[i]
            ni=ni+1
        elseif lex.types[i] ~= "whitespace"
        and lex.types[i] ~= "comment"
        and lex.types[i] ~= "newline"
        and lex.types[i] ~= "break" then
            mlex.tokens[ni] = lex.tokens[i]
            mlex.types[ni] = lex.types[i]
            mlex.pos[ni] = lex.pos[i]
            ni=ni+1
        end
    end
    -- Numbers

end 

return parser