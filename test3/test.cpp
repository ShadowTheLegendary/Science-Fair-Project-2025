#include <iostream>
#include <chrono>
#include <cmath>

int fib(int n) {
  double phi = (1 + std::sqrt(5)) / 2;
  double psi = (1 + std::sqrt(5)) / 2;
  return std::round((std::pow(phi, n) - std::pow(psi, n)) / std::sqrt(5));
}

int main() {
  long long total_duration = 0;

  auto start = std::chrono::high_resolution_clock::now();

  for (int i = 0; i < 100; ++i) {
    fib(70);
  }

  auto end = std::chrono::high_resolution_clock::now();

  auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
  total_duration = duration.count();

  double avgTimeMs = (double)total_duration / 100 / 1e6;

  std::cout << "Total time for " << 100 << " runs: " << total_duration << " ns" << std::endl;
  std::cout << "Average time per function call: " << avgTimeMs << " ms" << std::endl;

  return 0;
}