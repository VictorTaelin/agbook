module Base.U64.neq where

open import Base.U64.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.U64.eq as U64

neq : U64 → U64 → Bool
neq x y = not (U64.eq x y)

infix 4 _!=_
_!=_ : U64 → U64 → Bool
_!=_ = neq
