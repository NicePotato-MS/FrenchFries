local lexer = require("frfrlexer")
local tbl = require("frfrtable")

local function fileExists(filename)
    local file = io.open(filename, "r")
    if file then
        file:close()
        return true
    end
    return false
end

local filename = "out.txt"

-- Delete the file if it exists
if fileExists(filename) then
    os.remove(filename)
    print("Deleted existing file: " .. filename)
end

-- Create and open the file for appending
local file = io.open(filename, "a")
if file then
    print("Created and opened file: " .. filename)
else
    print("Failed to open file: " .. filename)
    os.exit(-1)
end

local function appendToFile(text)
    file:write(text .. "\n")
    file:flush()
end

local FFscript = io.open("example.frfr","r")
if not FFscript then os.exit(-1) end
local lexed = lexer.lex(FFscript:read("a"))
if not lexed then os.exit(-2) end
appendToFile(tbl.serial(lexed.tokens))
appendToFile(tbl.serial(lexed.types))
appendToFile(tbl.serial(lexed.pos))

file:close()