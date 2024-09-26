module Base.List.mfoldl where

open import Base.List.List
open import Base.Trait.Monad

-- Performs a monadic left fold over a list.
-- - M: The monad to operate in.
-- - f: The combining function that returns a monadic value.
-- - z: The initial value (for the empty list case).
-- - xs: The list to fold over.
-- = A monadic value containing the result of folding the list.
mfoldl : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set}
       → (B → A → M B) → B → List A → M B
mfoldl f z []        = pure z
mfoldl f z (x :: xs) = do
  z' ← f z x
  mfoldl f z' xs
