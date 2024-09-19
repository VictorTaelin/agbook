module Base.Char.eq where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Eq.Trait public

instance
  EqChar : Eq Char
  EqChar = record
    { eq = eq-char
    ; neq = neq-char
    }
    where
      eq-char : Char → Char → Bool
      eq-char = primCharEquality

      neq-char : Char → Char → Bool
      neq-char x y = not (eq-char x y)