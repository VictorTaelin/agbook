module HVM.State.show where

import Data.Bits.show as Bits
import HVM.Net.show as Net
import HVM.Term.show as Term
open import Data.Bits.Type
open import Data.List.Type
open import Data.List.map
open import Data.Map.to-list
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import HVM.State.Type
open import HVM.Term.Type

-- Converts a substitution (Pair Bits Term) to its string representation.
show-subst : Pair Bits Term → String
show-subst pair = Bits.show (fst pair) ++ " → " ++ Term.show (snd pair)

-- Converts an HVM State to its string representation.
-- - state: The HVM State to convert.
-- = A string representation of the HVM State.
show : State → String
show state = do
  let net-str    = "GNet:\n" ++ Net.show (State.gnet state)
  let subst-list = to-list (State.subs state)
  let subst-strs = map show-subst subst-list
  let subst-str  = "Subs:\n" ++ join "\n" subst-strs
  net-str ++ "\n\n" ++ subst-str
