module Base.List.Omega.Monad.pure where

open import Base.List.List
open import Base.List.Omega.Omega

-- Creates an Omega value containing a single element.
-- - x: The element to be wrapped in an Omega.
-- = An Omega containing a list with only the given element.
pure : ∀ {A : Set} → A → Omega A
pure x = MkOmega (x :: [])

