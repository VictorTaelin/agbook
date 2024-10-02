module HVM.Run.State.show where

import HVM.Net.show as Net
import HVM.Term.show as Term
import Base.OrdMap.to-list as OrdMap
open import Base.List.List
open import Base.List.map
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import HVM.Run.State.State
open import HVM.Term.Term
open import HVM.Mode.Mode

-- Converts a substitution (Pair String Term) to its string representation.
show-subst : Pair String (Term NAMED) → String
show-subst pair = (fst pair) ++ " → " ++ Term.show (snd pair)

-- Converts an HVM State to its string representation.
-- - state: The HVM State to convert.
-- = A string representation of the HVM State.
show : State NAMED → String
show state = do
  let net-str    = "GNet:\n" ++ Net.show (State.gnet state)
  let subst-list = OrdMap.to-list (State.subs state)
  let subst-strs = map show-subst subst-list
  let subst-str  = "Subs:\n" ++ join "\n" subst-strs
  net-str ++ "\n\n" ++ subst-str
