use std::time::Instant;

fn sort(list: &mut Vec<i32>) {
    let n = list.len();
    if n < 2 {
        return;
    }
    let mut x: usize = 0;
    let mut z: usize = 0;
    while z < n - 1 {
        if x < n - 1 {
            if list[x] > list[x + 1] {
                let y = list[x];
                list[x] = list[x + 1];
                list[x + 1] = y;
                z = 0;
            } else {
                z += 1;
            }
            x += 1;
        } else {
            x = 0;
        }
    }
}

fn main() {
    let list: Vec<i32> = (1..=100).rev().collect();
    let total_runs = 100;

    let start = Instant::now();

    for _ in 0..total_runs {
        let mut arr = list.clone();
        sort(&mut arr);
    }

    let duration = start.elapsed();
    let total_duration_ns = duration.as_nanos();
    let avg_time_ms = (total_duration_ns as f64 / total_runs as f64) / 1e6;

    println!("Total time for {} runs: {} ns", total_runs, total_duration_ns);
    println!("Average time per function call: {} ms", avg_time_ms);
}