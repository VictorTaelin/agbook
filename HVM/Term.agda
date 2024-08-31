-- (pair ($x 7) (λ$x(λa a) 8))
-- ----------------------------
-- (pair ($x 7) (λ$x(8) λa(a)))
-- (A B)
-- & ((7 A) 8) ~ ((a a) B)

-- PLANO: formalizar como o Interaction Calculus mesmo. motivo: o approach da
-- HVM2 (vars/atomic_link) é incompatível com lazy mode, pois não tem como ir de
-- uma var pra seu destino. porém, acredito que vars funcionem bem com o estilo
-- IC; o unico problema é que precisa re-aplicar o normalize em alguns casos

module HVM.Term where

open import Data.Nat.Main

data Term : Set where
  Var : Nat -> Term
  App : Term -> Term -> Term
  Lam : Term -> Term
