module Base.Pair.map where

open import Base.Pair.Pair

-- Maps functions over both components of a dependent pair.
-- This function applies f to the first component and g to the second component.
-- 1st: Function to apply to the first component.
-- 2nd: Function to apply to the second component, which can depend on the first.
-- 3rd: The input dependent pair.
-- = A new dependent pair with both components transformed.
map : ∀ {a b c d} {A : Set a} {B : A → Set b} {C : Set c} {D : C → Set d}
      → (f : A → C)
      → (g : (x : A) → B x → D (f x))
      → Sigma A B
      → Sigma C D
map f g (x , y) = f x , g x y

