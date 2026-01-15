#!/usr/bin/env luajit

local cjson = require "cjson.safe"

-- Variables for file naming
local FILENAME = "RISK_ASSESSMENT_RPT.md" or arg[1] 

-- File Helpers --

local function read_file(path)
    local file = assert(io.open(path, "r"))
    local content = file:read("*a")
    file:close()
    return content
end

-- Read Extension Update File --
local function check_ext_update()
    local file = io.open("last_update.txt", "r")
    if file then
        local content = file:read("*a")
        file:close()
        return content
    else
        return "Unknown (File not found)"
    end
end

-- Markdown Initialization --

local function init_markdown(ext_name, update_info)
    local f = io.open(FILENAME, "w")
    if f then
        f:write("# Browser Extension Risk Assessment: " .. ext_name .. "\n")
        f:write("> **Generated on:** " .. os.date() .. "\n")
        f:write("> **Extension Last Updated:** " .. update_info:gsub("\n", "") .. "\n\n")
        f:write("## Permission Analysis\n")
        f:write("| Type | Permission | Risk | Details & Notes |\n")
        f:write("| :--- | :--- | :---: | :--- |\n")
        f:close()
    end
end

local function write_md_row(perm_type, permission, risk, notes)
    local f = io.open(FILENAME, "a")
    if f then
        local clean_notes = notes:gsub("\n", " ")
        f:write(string.format("| %s | `%s` | **%s** | %s |\n", perm_type, permission, risk, clean_notes))
        f:close()
    end
end

-- Risk Reference --

local function load_permission_risk_reference()
    local content = read_file("./permission_risk_reference.json")
    local json_decoded = assert(cjson.decode(content))

    local lookup = {}
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

-- Manifest Parsing --

local function parse_manifest(content, risk_lookup, update_content)
    local manifest = assert(cjson.decode(content))
    local extension_name = manifest.name or "Unknown Extension"
    
    -- Initialize the Markdown file now that we have the name
    init_markdown(extension_name, update_content)

    print("Extension Name: " .. extension_name)
    print("Version: " .. (manifest.version or ""))
    print(string.rep("-", 100))

    local function process_perms(perm_list, label)
        for _, perm in ipairs(perm_list or {}) do
            local info = get_permission_risk(perm, risk_lookup)
            -- Console Output
            print(string.format("[%s] %-25s | %-8s | %s", label:upper(), perm, info.risk, info.notes))
            -- Markdown Output
            write_md_row(label, perm, info.risk, info.notes)
        end
    end

    process_perms(manifest.permissions, "Permission")
    process_perms(manifest.host_permissions, "Host")
    process_perms(manifest.optional_permissions, "Optional")

    -- Append Service Worker info
    if manifest.background and manifest.background.service_worker then
        local f = io.open(FILENAME, "a")
        if f then
            f:write("\n### Background Configuration\n")
            f:write("- **Service Worker:** `" .. manifest.background.service_worker .. "`\n")
            f:close()
        end
    end

    return extension_name
end

-- ---------- Execution ----------

-- 1. Get update info
local update_content = check_ext_update()
print("Update Reference: " .. update_content)

-- 2. Load resources
local manifest_content = read_file("./source_code_extraction/manifest.json")
local risk_lookup = load_permission_risk_reference()

-- 3. Parse Manifest (this now triggers the MD initialization)
parse_manifest(manifest_content, risk_lookup, update_content)

print("\n[SUCCESS] Assessment written to " .. FILENAME)
