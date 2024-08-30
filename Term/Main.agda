module Term.Main where

-- Represents a Higher-Order Abstract Syntax Term
-- - Lam: lambda abstraction
-- - App: function application
-- - Var: variable
data Term : Set where
  Lam : (bod : Term -> Term) -> Term
  App : (fun : Term) -> (arg : Term) -> Term
  Var : (idx : String) -> Term
