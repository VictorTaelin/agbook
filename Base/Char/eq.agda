module Base.Char.eq where

open import Base.Char.Type
open import Base.Bool.Type

eq : Char → Char → Bool
eq = primCharEquality

infix 4 _==_
_==_ : Char → Char → Bool
_==_ = eq
