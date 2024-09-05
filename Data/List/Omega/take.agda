module Data.List.Omega.take where

open import Data.List.Type
open import Data.List.Omega.Type
open import Data.Nat.Type

-- Takes the first n elements from an Omega list.
-- - n: The number of elements to take.
-- - omega: The Omega list to take elements from.
-- = A finite list containing the first n elements of omega, or all elements if n > length of omega's prefix.
take : ∀ {A : Set} → Nat → Omega A → List A
take Zero _ = []
take (Succ n) (MkOmega []) = []
take (Succ n) (MkOmega (x :: xs)) = x :: take n (MkOmega xs)
