module HVM2.Run.run where

open import Data.Bits.Type
open import Data.List.Type
open import Data.Map.Type
open import Data.Map.empty
open import Data.Pair.Type
open import HVM2.Net.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type

-- Runs a Run A computation with an initial State, returning an A
run : ∀ {A : Set} → Run A → A
run fun = do
  let initial-net = MkNet [] Era
  let (_ , res) = fun (MkState initial-net empty E)
  res
