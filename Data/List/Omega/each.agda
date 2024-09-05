module Data.List.Omega.each where

open import Data.List.Type
open import Data.List.Omega.Type

-- Creates an Omega from a list.
-- - xs: The input list.
-- = An Omega containing all elements from the input list.
each : ∀ {A : Set} → List A → Omega A
each xs = MkOmega xs
