module Base.Pair.map where

open import Base.Pair.Pair

map : ∀ {a b c d} {A : Set a} {B : A → Set b} {C : Set c} {D : C → Set d}
      → (f : A → C)
      → (g : (x : A) → B x → D (f x))
      → Sigma A B
      → Sigma C D
map f g (x , y) = f x , g x y
