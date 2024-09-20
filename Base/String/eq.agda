module Base.String.eq where

open import Base.String.Type
open import Base.Bool.Type

eq : String → String → Bool
eq = primStringEquality

infix 4 _==_
_==_ : String → String → Bool
_==_ = eq
