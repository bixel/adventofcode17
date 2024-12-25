use std::io;
use std::env;

mod aoc_00_hello_world;
mod aoc_01;
mod aoc_02;

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut program: &str = "";
    if args.len() >= 2 {
        program = &args[1];
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
        _ => println!("Command not found"),
    }
}
