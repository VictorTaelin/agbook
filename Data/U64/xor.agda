module Data.U64.xor where 

open import Data.U64.Type
open import Data.U64.from-nat
open import Data.Bits.Type
open import Data.Bits.from-nat renaming (from-nat to bits-from-nat)
open import Data.Bits.xor
open import Data.Nat.Type

xorU64 : U64 -> U64 -> Bits 
xorU64 a b = (bits-from-nat (primWord64ToNat a)) ^ (bits-from-nat (primWord64ToNat b))