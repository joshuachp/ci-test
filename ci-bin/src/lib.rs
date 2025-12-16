#![cfg_attr(not(feature = "std"), no_std)]

#[cfg(feature = "alloc")]
extern crate alloc;

/// Some test for the bin too
pub fn add(left: u64, right: u64) -> u64 {
    ci_lib::add(left, right)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn assert_true() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
