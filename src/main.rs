fn main() {
    println!("Hello, world!");
}

#[cfg(test)]
mod tests {
    #[test]
    fn assert_true() {
        assert_eq!(1, 1);
    }
}
