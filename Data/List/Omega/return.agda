module Data.List.Omega.return where

open import Data.List.Type
open import Data.List.Omega.Type

-- Creates an Omega value containing a single element.
-- - x: The element to be wrapped in an Omega.
-- = An Omega containing a list with only the given element.
return : ∀ {A : Set} → A → Omega A
return x = MkOmega (x :: [])
