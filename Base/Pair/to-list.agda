module Base.Pair.to-list where

open import Base.Pair.Pair
open import Base.List.List

to-list : ∀ {a} {A : Set a} → Pair A A → List A
to-list (x , y) = x :: y :: []
