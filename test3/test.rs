use std::time::Instant;

fn fib(n: u32) -> u64 {
    let phi = (1.0 + 5.0_f64.sqrt()) / 2.0;
    let psi = (1.0 - 5.0_f64.sqrt()) / 2.0;
    return ((phi.powf(n as f64) - psi.powf(n as f64)) / 5.0_f64.sqrt()).round() as u64;
}

fn main() {
    let total_runs = 100;

    let start = Instant::now();

    for _ in 0..total_runs {
        fib(70);
    }

    let duration = start.elapsed();
    let total_duration_ns = duration.as_nanos();
    let avg_time_ms = (total_duration_ns as f64 / total_runs as f64) / 1e6;

    println!("Total time for {} runs: {} ns", total_runs, total_duration_ns);
    println!("Average time per function call: {} ms", avg_time_ms);
}
