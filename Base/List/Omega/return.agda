module Base.List.Omega.return where

open import Base.List.Type
open import Base.List.Omega.Type

-- Creates an Omega value containing a single element.
-- - x: The element to be wrapped in an Omega.
-- = An Omega containing a list with only the given element.
return : ∀ {A : Set} → A → Omega A
return x = MkOmega (x :: [])
