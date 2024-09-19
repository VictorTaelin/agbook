module Base.Pair.get-fst where

open import Base.Pair.Type

get-fst : ∀ {a b} {A : Set a} {B : A → Set b} → Sigma A B → A
get-fst (x , _) = x
