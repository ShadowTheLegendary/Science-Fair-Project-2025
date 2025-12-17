#include <iostream>
#include <vector>
#include <chrono>

void sort(std::vector<int>& list) {
    int x = 0;
    int z = 0;
    while (z < list.size() - 1) {
        if (x < list.size() - 1) {
            if (list[x] > list[x+1]) {
                int y = list[x];
                list[x] = list[x+1];
                list[x+1] = y;
            }
            else {
                z += 1;
            }
            x += 1;
        }
        else {
            x = 0;
            z = 0;
        }
    }
}

int main() {
    std::vector<int> list;
    for (int i = 100; i >= 1; --i) {
        list.push_back(i);
    }
    long long total_duration = 0;

    auto start = std::chrono::high_resolution_clock::now();

    for (int i = 0; i < 100; ++i) {
        sort(list);
    }

    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    total_duration = duration.count();

    double avgTimeMs = (double)total_duration / 100 / 1e6;

    std::cout << "Total time for " << 100 << " runs: " << total_duration << " ns" << std::endl;
    std::cout << "Average time per function call: " << avgTimeMs << " ms" << std::endl;

    return 0;
}
