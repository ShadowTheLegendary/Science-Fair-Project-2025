import time

def hello():
    x = 0
    while x < 1_000_000:
        x += 1

def main():
    total_runs = 100

    start = time.perf_counter_ns()

    for _ in range(total_runs):
        hello()

    end = time.perf_counter_ns()

    total_duration = end - start
    avg_time_ms = total_duration / total_runs / 1e6

    print(f"Total time for {total_runs} runs: {total_duration} ns")
    print(f"Average time per function call: {avg_time_ms} ms")

if __name__ == "__main__":
    main()