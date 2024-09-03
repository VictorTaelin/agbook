module Data.Bits.pad-length where

open import Data.Bits.Type
open import Data.Pair.Type

-- Ensures two Bits values have the same length by padding with leading zeros.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = A pair of Bits values with equal length, padded if necessary.
pad-length : Bits → Bits → Pair Bits Bits
pad-length E b = E , b
pad-length a E = a , E
pad-length (O a) (O b) = let a' , b' = pad-length a b in O a' , O b'
pad-length (O a) (I b) = let a' , b' = pad-length a b in O a' , I b'
pad-length (I a) (O b) = let a' , b' = pad-length a b in I a' , O b'
pad-length (I a) (I b) = let a' , b' = pad-length a b in I a' , I b'
