module Data.Char.show where

open import Data.Char.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.from-char
open import Data.Trait.Show public

instance
  ShowChar : Show Char
  ShowChar = record { to-string = show-char }
    where
      show-char : Char → String
      show-char c = "'" ++ from-char c ++ "'"

