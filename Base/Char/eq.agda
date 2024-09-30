module Base.Char.eq where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primCharEquality : Char → Char → Bool

eq : Char → Char → Bool
eq = primCharEquality

infix 4 _==_
_==_ : Char → Char → Bool
_==_ = eq
