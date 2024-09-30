module Base.Char.show where

open import Base.Char.Char
open import Base.String.String
open import Base.String.append
open import Base.String.from-char

show : Char → String
show c = "'" ++ from-char c ++ "'"
