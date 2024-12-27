fn find_direction(
    matrix: &str,
    dim: &usize,
    word: &str,
    pos_start: &(usize, usize),
    dir: &(i32, i32),
) -> bool {
    let mut idxs: Vec<usize> = Vec::new();
    for i in 0..word.len() {
        let dx = (i as i32) * dir.0;
        let dy = (i as i32) * dir.1;
        let new_x = pos_start.0 as i32 + dx;
        let new_y = pos_start.1 as i32 + dy;
        if !(new_x >= 0 && new_x < *dim as i32 && new_y >= 0 && new_y < *dim as i32) {
            return false;
        }
        let idx_next = new_x + new_y * *dim as i32;
        idxs.push(idx_next as usize);
    }
    let word_search = idxs
        .iter()
        .map(|i| matrix.get(*i..=*i).unwrap())
        .collect::<String>();
    return *word == word_search;
}

fn scan_for_word(matrix: &str, dim: &usize, word: &str, pos_start: &(usize, usize)) -> i32 {
    let mut cnt = 0;
    for dir in [
        (1, 0),
        (1, 1),
        (0, 1),
        (-1, 1),
        (-1, 0),
        (-1, -1),
        (0, -1),
        (1, -1),
    ] {
        if find_direction(matrix, dim, word, pos_start, &dir) {
            cnt += 1;
        }
    }
    return cnt;
}

fn scan_for_xword(matrix: &str, dim: &usize, pos_start: &(usize, usize)) -> i32 {
    let idx_pos_start = pos_start.0 + pos_start.1 * *dim;
    let str_start = matrix.get(idx_pos_start..=idx_pos_start).unwrap();
    if str_start != "A" {
        return 0;
    }

    let word_am = "AM";
    let word_as = "AS";
    let mut cnt = 0;
    for dir in [(1, 1), (1, -1), (-1, -1), (-1, 1)] {
        if find_direction(matrix, dim, &word_am, pos_start, &dir)
            && find_direction(matrix, dim, &word_as, pos_start, &(-1 * dir.0, -1 * dir.1))
        {
            cnt += 1;
        }
    }
    if cnt == 2 {
        return 1;
    } else {
        return 0;
    }
}

pub fn function_a(input: &Vec<String>, debug: Option<bool>) -> i32 {
    let debug = debug.unwrap_or(false);
    let input_joined = input.concat();
    let dim_x = input[0].len();
    let dim_y = input.len();
    let mut cnt_total = 0;
    assert!(dim_x == dim_y);
    if debug {
        println!("Input:\n{}", input.join("\n"))
    }
    for x in 0..dim_x {
        for y in 0..dim_y {
            cnt_total += scan_for_word(&input_joined.as_str(), &dim_x, "XMAS", &(x, y))
        }
    }
    return cnt_total;
}

pub fn function_b(input: &Vec<String>, debug: Option<bool>) -> i32 {
    let debug = debug.unwrap_or(false);
    let input_joined = input.concat();
    let dim_x = input[0].len();
    let dim_y = input.len();
    let mut cnt_total = 0;
    assert!(dim_x == dim_y);
    if debug {
        println!("Input:\n{}", input.join("\n"))
    }
    for x in 0..dim_x {
        for y in 0..dim_y {
            cnt_total += scan_for_xword(&input_joined.as_str(), &dim_x, &(x, y))
        }
    }
    return cnt_total;
}
