module Base.String.eq where

open import Base.String.Type
open import Base.Bool.Type

eq : String → String → Bool
eq = primStringEquality
