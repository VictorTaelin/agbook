module Base.String.head where

open import Base.String.Type
open import Base.String.to-list
open import Base.Char.Type
open import Base.Maybe.Type
open import Base.List.Type

head : String → Maybe Char
head s with to-list s
... | []       = None
... | (c :: _) = Some c
