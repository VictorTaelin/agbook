module Base.List.all-equal where

open import Base.List.List
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Trait.Eq

all-equal : ∀ {A : Set} {{EqA : Eq A}} -> List A -> Bool
all-equal []             = True
all-equal (x :: [])      = True
all-equal (x :: y :: xs) = (x == y) && all-equal (y :: xs)
