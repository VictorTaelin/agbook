module Base.List.Monad.return where

open import Base.List.Type

-- The return function for the List monad.
-- Wraps a single element in a list.
-- - x: The element to wrap.
-- = A list containing only x.
return : ∀ {A : Set} → A → List A
return x = x :: []

