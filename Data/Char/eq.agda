module Data.Char.eq where

open import Data.Char.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type

open import Data.Trait.Eq public

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