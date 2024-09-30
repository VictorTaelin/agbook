module Base.F64.lte where

open import Base.F64.F64
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.F64.lt

lte : F64 → F64 → Bool
lte x y = not (lt y x)

infix 4 _<=_
_<=_ : F64 → F64 → Bool
_<=_ = lte
