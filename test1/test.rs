use std::time::Instant;

fn hello() {
    let mut x = 0;
    while x < 1_000_000 {
        x += 1;
    }
}

fn main() {
    let total_runs = 100;

    let start = Instant::now();

    for _ in 0..total_runs {
        hello();
    }

    let duration = start.elapsed();
    let total_duration_ns = duration.as_nanos();
    let avg_time_ms = (total_duration_ns as f64 / total_runs as f64) / 1e6;

    println!("Total time for {} runs: {} ns", total_runs, total_duration_ns);
    println!("Average time per function call: {} ms", avg_time_ms);
}
