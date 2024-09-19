module Base.String.is-empty where

open import Base.Bool.Type
open import Base.String.Type
open import Base.List.Type
open import Base.Char.Type
open import Base.String.to-list

is-empty : String → Bool
is-empty s with to-list s
... | []       = True
... | (_ :: _) = False
