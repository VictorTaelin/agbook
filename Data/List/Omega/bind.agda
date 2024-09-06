module Data.List.Omega.bind where

open import Data.List.Type
open import Data.List.map
open import Data.List.diagonal
open import Data.List.Omega.Type

-- Binds an Omega value with a function that returns an Omega.
-- - omega: The input Omega value.
-- - f: The function to apply to each element in the Omega.
-- = A new Omega resulting from applying f to each element and flattening the result.
bind : ∀ {A B : Set} → Omega A → (A → Omega B) → Omega B
bind (MkOmega m) f = MkOmega (diagonal (map (λ x → Omega.runOmega (f x)) m))
