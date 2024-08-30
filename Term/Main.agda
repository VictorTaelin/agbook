module Term.Main where

open import String.Main

-- Represents a Higher-Order Abstract Syntax Term.
-- - Lam: an abstraction.
-- - App: an application.
-- - Var: a variable.
data Term : Set where
  Lam : (bod : Term -> Term) -> Term
  App : (fun : Term) -> (arg : Term) -> Term
  Var : (idx : String) -> Term
