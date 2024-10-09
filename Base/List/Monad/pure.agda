module Base.List.Monad.pure where

open import Base.List.List

-- The pure function for the List monad.
-- Wraps a single element in a list.
-- - x: The element to wrap.
-- = A list containing only x.
pure : ∀ {A : Set} → A → List A
pure x = x :: []

