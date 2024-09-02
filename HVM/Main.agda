module HVM.Main where

open import Data.Bits.Type
open import HVM.Fun.run
open import HVM.Term.Type
open import HVM.Term.reduce
open import HVM.Term.show

main : Term
main = show (run (reduce (App (Lam E (Var E)) (Var (O E)))))
