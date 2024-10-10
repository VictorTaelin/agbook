module Base.List.for where

open import Base.List.List
open import Base.Trait.Monad
open import Base.Function.flip
open import Base.List.mmap

-- Applies a monadic function to each element of a list.
-- This is similar to mmap, but with the list argument first.
-- - xs: The list of elements to process.
-- - f: The monadic function to apply to each element.
-- = A monadic list containing the results of applying f to each element of xs.
for : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set} → List A → (A → M B) → M (List B)
for = flip mmap

