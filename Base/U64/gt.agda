module Base.U64.gt where

open import Base.U64.Type
open import Base.Bool.Type
import Base.Nat.gt as Nat

gt : U64 → U64 → Bool
gt x y = Nat.gt (primWord64ToNat x) (primWord64ToNat y)

infix 4 _>_
_>_ : U64 → U64 → Bool
_>_ = gt
