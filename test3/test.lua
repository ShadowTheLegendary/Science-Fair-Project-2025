-- Function to round a number to the nearest integer
function round(num)
    return math.floor(num + 0.5)
end

-- Fibonacci function using Binet's formula
function fib(n)
    local phi = (1 + math.sqrt(5)) / 2
    local psi = (1 - math.sqrt(5)) / 2
    return round((phi^n - psi^n) / math.sqrt(5))
end

-- Measure the time for multiple runs
local total_runs = 100
local start = os.clock()

for i = 1, total_runs do
    fib(70)
end

local finish = os.clock()

local total_duration_ns = (finish - start) * 1e9
local avg_time_ms = (total_duration_ns / total_runs) / 1e6

print("Total time for " .. total_runs .. " runs: " .. total_duration_ns .. " ns")
print("Average time per function call: " .. avg_time_ms .. " ms")