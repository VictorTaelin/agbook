module Base.Bits.gte where

open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Bits.gt
open import Base.Bool.not

gte : Bits → Bits → Bool
gte a b = not (gt b a)

infix 4 _>=_
_>=_ : Bits → Bits → Bool
_>=_ = gte
