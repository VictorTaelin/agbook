module Base.Char.show where

open import Base.Char.Type
open import Base.String.Type
open import Base.String.append
open import Base.String.from-char
open import Base.Show.Trait public

instance
  ShowChar : Show Char
  ShowChar = record { to-string = show-char }
    where
      show-char : Char → String
      show-char c = "'" ++ from-char c ++ "'"

