module Data.U64.add where 

open import Data.U64.Type
open import Data.U64.from-nat
open import Data.Bits.Type
open import Data.Bits.from-nat renaming (from-nat to bits-from-nat)
open import Data.Bits.add
open import Data.Nat.Type

addU64 : U64 -> U64 -> Bits 
addU64 a b = (bits-from-nat (primWord64ToNat a)) + (bits-from-nat (primWord64ToNat b))

