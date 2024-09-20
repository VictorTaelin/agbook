module Base.U64.gte where

open import Base.U64.Type
open import Base.Bool.Type
import Base.Nat.gte as Nat

gte : U64 → U64 → Bool
gte x y = Nat.gte (primWord64ToNat x) (primWord64ToNat y)

infix 4 _>=_
_>=_ : U64 → U64 → Bool
_>=_ = gte
