module Base.Nat.to-u64 where

open import Base.Nat.Type
open import Base.U64.Type

primitive primWord64FromNat : Nat → U64

to-u64 : Nat → U64
to-u64 = primWord64FromNat
