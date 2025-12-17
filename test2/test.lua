function copy_table(original)
    local copy = {}
    for i, v in ipairs(original) do
        copy[i] = v
    end
    return copy
end

function sort(list)
    local x = 1
    local z = 0
    while z < #list - 1 do
        if x < #list then
            if list[x] > list[x + 1] then
                local y = list[x]
                list[x] = list[x + 1]
                list[x + 1] = y
            else
                z = z + 1
            end
            x = x + 1
        else
            x = 1
            z = 0
        end
    end
end

local list = {}
for i = 100, 1, -1 do
    table.insert(list, i)
end

local total_runs = 100

local start = os.clock()

for i = 1, total_runs do
    local list_copy = copy_table(list)
    sort(list_copy)
end

local finish = os.clock()

local total_duration_ns = (finish - start) * 1e9
local avg_time_ms = (total_duration_ns / total_runs) / 1e6

print("Total time for " .. total_runs .. " runs: " .. total_duration_ns .. " ns")
print("Average time per function call: " .. avg_time_ms .. " ms")