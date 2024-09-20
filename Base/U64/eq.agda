module Base.U64.eq where

open import Base.U64.Type
open import Base.Nat.Type
open import Base.Bool.Type
import Base.Nat.eq as Nat

eq : U64 → U64 → Bool
eq x y = Nat.eq (primWord64ToNat x) (primWord64ToNat y)
