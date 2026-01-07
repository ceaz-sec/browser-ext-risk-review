#!/usr/bin/env luajit

local cjson = require "cjson.safe"

-- File Helpers --

local function read_file(path)
    local file = assert(io.open(path, "r"))
    local content = file:read("*a")
    file:close()
    return content
end

-- Risk Reference --

local function load_permission_risk_reference()
    local content = read_file("./permission_risk_reference.json")
    local json_decoded = assert(cjson.decode(content))

    local lookup = {} -- Table creation
    for _, entry in ipairs(json_decoded.permissions or {}) do
        lookup[entry.name] = {
            risk  = entry.risk,
            notes = entry.notes
        }
    end
    return lookup
end

local function get_permission_risk(permission, lookup)
    return lookup[permission] or {
        risk = "UNKNOWN",
        notes = "Permission not found in reference"
    }
end

-- Read Update File --
local function check_ext_update()
    local file = io.open("last_update.txt", "r")
    if file then
        content = file:read("*a")
        file:close()
        --print("Read update file successfully")
    else
        return "Error: Could not read file"
    end
    return content
end

-- Manifest Parsing --

local function parse_manifest(content, risk_lookup)
    local manifest = assert(cjson.decode(content))

    print("Extension Name: " .. (manifest.name or ""))
    print("Version: " .. (manifest.version or ""))
    print(string.rep("-", 100))

    -- Permissions
    for _, perm in ipairs(manifest.permissions or {}) do
        local info = get_permission_risk(perm, risk_lookup)
        print(string.format(
            "[PERMISSION] %-25s | %-8s | %s",
            perm, info.risk, info.notes
        ))
    end

    -- Host Permissions
    for _, perm in ipairs(manifest.host_permissions or {}) do
        local info = get_permission_risk(perm, risk_lookup)
        print(string.format(
            "[HOST]       %-25s | %-8s | %s",
            perm, info.risk, info.notes
        ))
    end

    -- Optional Permissions
    for _, perm in ipairs(manifest.optional_permissions or {}) do
        local info = get_permission_risk(perm, risk_lookup)
        print(string.format(
            "[OPTIONAL]   %-25s | %-8s | %s",
            perm, info.risk, info.notes
        ))
    end

    -- Background Service Worker
    if manifest.background and manifest.background.service_worker then
        print("Service Worker: " .. manifest.background.service_worker)
    end
end

-- ---------- Execution ----------

local manifest_content = read_file("./source_code_extraction/manifest.json")
local risk_lookup = load_permission_risk_reference()
local content = check_ext_update()
print(content)
parse_manifest(manifest_content, risk_lookup)

