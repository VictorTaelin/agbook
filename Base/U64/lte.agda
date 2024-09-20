module Base.U64.lte where

open import Base.U64.Type
open import Base.Bool.Type
import Base.Nat.lte as Nat

lte : U64 → U64 → Bool
lte x y = Nat.lte (primWord64ToNat x) (primWord64ToNat y)

infix 4 _<=_
_<=_ : U64 → U64 → Bool
_<=_ = lte
