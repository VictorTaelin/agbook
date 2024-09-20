module Base.U64.lt where

open import Base.U64.Type
open import Base.Bool.Type
import Base.Nat.lt as Nat

lt : U64 → U64 → Bool
lt x y = Nat.lt (primWord64ToNat x) (primWord64ToNat y)
