module Base.Tree.all-equal where

open import Base.Tree.Type
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Trait.Eq

all-equal : ∀ {A : Set} {{EqA : Eq A}} → Tree A → Bool
all-equal Leaf = True
all-equal (Node x left right) = all-equal-to x left && all-equal-to x right
  where
    all-equal-to : ∀ {A : Set} {{EqA : Eq A}} → A → Tree A → Bool
    all-equal-to _ Leaf = True
    all-equal-to x (Node y left right) = 
      (x == y) && all-equal-to x left && all-equal-to x right