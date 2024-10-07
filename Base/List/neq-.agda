module Base.List.neq- where

open import Base.Bool.Bool
open import Base.Bool.Trait.Eq
open import Base.Equal.Equal
open import Base.List.List
open import Base.List.neq

test-neq-bool-lists : ((True :: False :: []) != (True :: True :: [])) ≡ True
test-neq-bool-lists = refl
