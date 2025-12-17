#include <iostream>
#include <chrono> 

void hello() {
  int x = 0;
  while (x < 1000000) {
    x += 1;
  }
}

int main() {
    long long total_duration = 0;

    auto start = std::chrono::high_resolution_clock::now();

    for (int i = 0; i < 100; ++i) {
        hello();
    }

    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    total_duration = duration.count();

    double avgTimeMs = (double)total_duration / 100 / 1e6;

    std::cout << "Total time for " << 100 << " runs: " << total_duration << " ns" << std::endl;
    std::cout << "Average time per function call: " << avgTimeMs << " ms" << std::endl;

    return 0;
}