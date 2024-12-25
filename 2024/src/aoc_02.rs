fn report_is_safe(report: &Vec<i32>) -> bool {
    let mut is_safe: bool = true;
    let mut is_first_num: bool = true;
    let mut prev_num: i32 = 0;
    let mut dir_prev: i32 = 0;
    for num in report {
        if is_first_num {
            is_first_num = false;
        } else {
            let diff = num - prev_num;
            if ![1, 2, 3].contains(&diff.abs()) {
                is_safe = false;
                break;
            }
            assert!(diff != 0);
            let dir = diff / diff.abs();
            if dir_prev != 0 && dir != dir_prev {
                is_safe = false;
                break;
            }
            dir_prev = diff / diff.abs();
        }
        prev_num = *num;
    }
    return is_safe;
}

pub fn function_a(input: &Vec<String>) -> i32 {
    let mut count_safe: i32 = 0;
    for line in input {
        let report: Vec<i32> = line.split(" ").map(|s| s.parse().unwrap()).collect();
        if report_is_safe(&report) {
            count_safe += 1;
            println!("{} is safe", line);
        } else {
            println!("{} is not safe", line);
        }
    }
    return count_safe;
}

pub fn function_b(input: &Vec<String>) -> i32 {
    let mut count_safe: i32 = 0;
    for line in input {
        let report: Vec<i32> = line.split(" ").map(|s| s.parse().unwrap()).collect();
        let mut line_is_safe = false;
        if report_is_safe(&report) {
            count_safe += 1;
            println!("{} is safe without damping", line);
            continue;
        }
        for i in 0..report.len() {
            let mut problem_damped_report = report.clone();
            problem_damped_report.remove(i);
            if report_is_safe(&problem_damped_report) {
                count_safe += 1;
                println!("{} is safe with damping", line);
                line_is_safe = true;
                break;
            }
        }
        if !line_is_safe {
            println!("{} is not safe", line);
        }
    }
    return count_safe;
}
