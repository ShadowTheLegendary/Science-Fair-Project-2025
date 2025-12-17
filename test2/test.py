import copy
import time

def sort(list):
    x = 0
    z = 0
    while z < len(list) - 1:
        if x < len(list) - 1:
            if list[x] > list[x+1]:
                y = list[x]
                list[x] = list[x+1]
                list[x+1] = y
            else:
                z += 1
            x += 1
        else:
            x = 0
            z = 0

def main():
    list = list(range(1, 101))
    list.reverse()
    total_runs = 100

    start = time.perf_counter_ns()

    for _ in range(total_runs):
        sort()

    end = time.perf_counter_ns()

    total_duration = end - start
    avg_time_ms = total_duration / total_runs / 1e6

    print(f"Total time for {total_runs} runs: {total_duration} ns")
    print(f"Average time per function call: {avg_time_ms} ms")

if __name__ == "__main__":
    main()