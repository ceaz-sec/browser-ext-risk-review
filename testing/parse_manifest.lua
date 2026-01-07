#!/usr/bin/env luajit

local cjson = require("cjson.safe")

local file = assert(io.open("manifest.json", "r"))
local content = file:read("*a")
file:close()

local manifest = assert(cjson.decode(content))

local name = manifest.name or ""
print("Extension Version: " .. name)

for _, perm in ipairs(manifest.permissions or {}) do
    print("Permission:", perm)
end

for key, value in pairs(manifest) do
    print(key, value)
end
