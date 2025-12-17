function hello()
    local x = 0
    while x < 1000000 do
        x = x + 1
    end
end

local total_runs = 100

local start = os.clock()

for i = 1, total_runs do
    hello()
end

local finish = os.clock()

local total_duration_ns = (finish - start) * 1e9
local avg_time_ms = (total_duration_ns / total_runs) / 1e6

print("Total time for " .. total_runs .. " runs: " .. total_duration_ns .. " ns")
print("Average time per function call: " .. avg_time_ms .. " ms")
