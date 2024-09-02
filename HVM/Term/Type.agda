module HVM.Term.Type where

open import Data.Bits.Type

data Term : Set where
  Var : (nam : Bits) → Term
  App : (fun : Term) → (arg : Term) → Term
  Lam : (nam : Bits) → (bod : Term) → Term
