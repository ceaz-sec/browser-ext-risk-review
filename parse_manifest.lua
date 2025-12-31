#!/usr/bin/env luajit

local cjson = require "cjson.safe"

local function read_file()
-- Read the Manifest file
    local file = assert(io.open("./source_code_extraction/manifest.json", "r"))
    local content = file:read("*a")
    file:close()
    return content
end

local function parse_manifest(content)
    local manifest = assert(cjson.decode(content))
    local name = manifest.name or ""
    local version = manifest.version or ""
    print("Extension Name: " .. name)
    print("Version: " .. version) 

-- Parse Permissions
    for _, perm in ipairs(manifest.permissions or {}) do
        print("Permission: --> " .. perm)
    end

    for _, perm in pairs(manifest.host_permissions or {}) do
        print("Host_Permissions: --> " .. perm)
    end

    for _, perm in pairs(manifest.optional_permissions or {}) do
        print("Optional Permissions: --> " .. perm)
    end

--Obtain the Service Worker file
    for _, perm in pairs(manifest.background or {}) do
        print("Service Worker: " .. perm)
    end
end

-- Execution --

content = read_file()
parse_manifest(content)
