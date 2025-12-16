#![cfg_attr(not(feature = "std"), no_std)]

#[cfg(feature = "alloc")]
extern crate alloc;

fn main() {
    #[cfg(feature = "std")]
    println!("Hello, world!");
}

#[cfg(not(any(feature = "std", test)))]
#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
