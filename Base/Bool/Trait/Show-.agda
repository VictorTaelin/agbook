module Base.Bool.Trait.Show- where

open import Base.Bool.Bool
open import Base.Bool.Trait.Show
open import Base.String.String
open import Base.Equal.Equal
open import Base.Trait.Show

test-show-trait-true : to-string True ≡ "true"
test-show-trait-true = refl

test-show-trait-false : to-string False ≡ "false"
test-show-trait-false = refl

