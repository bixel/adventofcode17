use std::collections::HashMap;
use std::iter::zip;

pub fn read_input_to_vec(input: &Vec<String>, vec_left: &mut Vec<i32>, vec_right: &mut Vec<i32>) {
    for line in input {
        let line_val = line;
        let line_split: Vec<&str> = line_val.split(" ").collect();
        let left: i32 = line_split[0].parse().unwrap();
        let right: i32 = line_split[line_split.len() - 1].parse().unwrap();
        vec_left.push(left);
        vec_right.push(right);
    }
}

pub fn function_a(input: &Vec<String>) -> i32 {
    let mut list_left: Vec<i32> = Vec::new();
    let mut list_right: Vec<i32> = Vec::new();
    read_input_to_vec(&input, &mut list_left, &mut list_right);
    list_left.sort();
    list_right.sort();
    let distance = zip(list_left, list_right)
        .into_iter()
        .map(|x| (x.0 - x.1).abs())
        .sum();
    return distance;
}

pub fn function_b(input: &Vec<String>) -> i32 {
    let mut list_left: Vec<i32> = Vec::new();
    let mut list_right: Vec<i32> = Vec::new();
    read_input_to_vec(&input, &mut list_left, &mut list_right);
    let mut map: HashMap<i32, i32> = HashMap::new();
    for num_left in list_left {
        let num_matches = list_right.iter().filter(|x| **x == num_left).count();
        let score = (num_matches as i32) * num_left;
        map.entry(num_left)
            .and_modify(|e| *e += score)
            .or_insert(score);
    }
    return map.into_values().sum();
}
