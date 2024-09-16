module Data.U64.xor where 

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Bits.xor renaming (xor to xorB; _^_ to _^b_ )
open import Data.Nat.Type
open import Data.U64.to-bits
open import Data.Bits.to-nat 


xor : U64 -> U64 -> U64 
xor a b = primWord64FromNat (to-nat ((to-bits a) ^b (to-bits b)))


infixl 6 _^_
_^_ : U64 -> U64 -> U64
_^_ = xor
