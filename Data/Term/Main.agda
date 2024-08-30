module Data.Term.Main where

open import Data.String.Main

-- Represents a Higher-Order Abstract Syntax Term.
-- - Lam: An abstraction.
-- - App: An application.
-- - Var: A variable.
data Term : Set where
  Lam : (bod : Term → Term) → Term
  App : (fun : Term) → (arg : Term) → Term
  Var : (idx : String) → Term
