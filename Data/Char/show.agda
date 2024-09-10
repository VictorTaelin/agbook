module Data.Char.show where

open import Data.Char.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.from-char
open import Data.Trait.Show

instance
  ShowChar : Show Char
  ShowChar = record { toString = showChar }
    where
      showChar : Char → String
      showChar c = "'" ++ from-char c ++ "'"

-- Tests
open import Data.Equal.Type

_ : show 'a' === "'a'"
_ = refl

_ : show '1' === "'1'"
_ = refl

_ : show ' ' === "' '"
_ = refl
