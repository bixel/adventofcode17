use std::io;
use std::env;

mod aoc_00_hello_world;
mod aoc_01;
mod aoc_02;
mod aoc_03;
mod aoc_04;

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut program: &str = "";
    let mut debug = false;
    if args.len() >= 2 {
        program = &args[1];
    }
    if args.len() >= 3 {
        debug = &args[2].to_lowercase() == "--debug";
    }

    let lines = io::stdin().lines();
    let line_vec: Vec<String> = lines.map(|x| x.unwrap()).collect();

    match program {
        "0" => aoc_00_hello_world::main(),
        "1" => {
            println!("{}", aoc_01::function_a(&line_vec));
            println!("{}", aoc_01::function_b(&line_vec));
        },
        "2" => {
            println!("{}", aoc_02::function_a(&line_vec));
            println!("{}", aoc_02::function_b(&line_vec));
        },
        "3" => {
            println!("{}", aoc_03::function_a(&line_vec, Some(debug)));
        },
        "4" => {
            println!("{}", aoc_04::function_a(&line_vec, Some(debug)));
        },
        _ => println!("Command not found"),
    }
}
