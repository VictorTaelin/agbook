module Base.List.mmap where

open import Base.List.List
open import Base.Trait.Monad

-- Applies a function to each element of a list, passing the mapped value to a monadic function.
-- This allows for lazy evaluation of the mapped values.
-- - f: The function to apply to each element.
-- - xs: The elements to apply f to.
-- = A new list with the mapped values from g applied to the results of f.
mmap : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set}
       → (A → M B) → List A → M (List B)
mmap f []        = pure []
mmap f (x :: xs) = do
  y  <- f x
  ys <- mmap f xs
  pure (y :: ys)

