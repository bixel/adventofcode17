pub fn function_a(input: &Vec<String>, debug: Option<bool>) -> i32 {
    let debug = debug.unwrap_or(false);
    let input_concat = input.concat();
    let mut sum = 0;
    let mut do_sum = true;
    let mut pos_scan: usize = 0;
    while pos_scan < input_concat.len() - 4 {
        let pos_scan_end = if pos_scan < input_concat.len() - 8 {
            pos_scan + 8
        } else {
            input_concat.len()
        };
        let scan_part = &input_concat[pos_scan..pos_scan_end];
        if scan_part.starts_with("do()") {
            do_sum = true;
            pos_scan += 4;
            if debug {
                println!("Turn on summation at {}.", pos_scan);
            }
        } else if scan_part.starts_with("don't()") {
            do_sum = false;
            pos_scan += 5;
            if debug {
                println!("Turn off summation at {}.", pos_scan);
            }
        } else if scan_part.starts_with("mul(") {
            pos_scan += 4;
            if !do_sum {
                if debug {
                    println!("Skipping `mul(` at {}", pos_scan);
                }
                continue;
            }
            let mut pos_sep = pos_scan;
            let mut found_sep = false;
            let mut pos_end = pos_scan;
            while "0123456789,)".contains(&input_concat.chars().nth(pos_end).unwrap().to_string())
                && pos_end <= input_concat.len()
            {
                let char = &input_concat.chars().nth(pos_end).unwrap();
                if *char == ')' && found_sep {
                    let left: i32 = input_concat[pos_scan..pos_sep].parse().unwrap();
                    let right: i32 = input_concat[pos_sep + 1..pos_end].parse().unwrap();
                    let result = left * right;
                    if debug {
                        println!(
                            "Found mul({},{}) = {} at pos {}",
                            left, right, result, pos_scan
                        )
                    };
                    sum += result;
                    break;
                } else if *char == ',' {
                    if !found_sep {
                        pos_sep = pos_end;
                        found_sep = true;
                    } else {
                        if debug {
                            println!("Found multiple seps")
                        };
                        break;
                    }
                }
                pos_end += 1;
            }
            pos_scan = pos_end;
            if debug {
                println!("Found `mul(` at pos {}", pos_scan)
            };
        } else {
            pos_scan += 1;
        }
    }
    return sum;
}
