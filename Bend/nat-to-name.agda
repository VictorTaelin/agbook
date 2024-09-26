module Bend.nat-to-name where

{- 
pub fn num_to_name(mut num: u64) -> String {
  let mut name = String::new();
  loop {
    let c = (num % 26) as u8 + b'a';
    name.push(c as char);
    num /= 26;
    if num == 0 {
      break;
    }
  }
  name
}
 -}

open import Base.Char.Char
open import Base.Char.from-nat
open import Base.Char.to-nat
open import Base.List.List
open import Base.List.map
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.div
open import Base.Nat.mod
open import Base.String.String
open import Base.String.from-list


{-# TERMINATING #-}
-- Converts a natural number into a unique name.
-- - n: The number to convert.
-- = A unique string representation of the number, using only lowercase ascii characters.
nat-to-name : Nat -> String
nat-to-name n = do
  from-list (nat-to-letters n)
  where
    nat-to-letter : Nat -> Char
    nat-to-letter n = from-nat (n + (to-nat 'a'))

    -- TODO: Show that it's terminating because (n / 26) < n
    nat-to-letters' : Nat -> List Char
    nat-to-letters' 0 = []
    nat-to-letters' n = nat-to-letter (n % 26) :: nat-to-letters' (div n 26)

    nat-to-letters : Nat -> List Char
    nat-to-letters n = nat-to-letter (n % 26) :: nat-to-letters (div n 26)
