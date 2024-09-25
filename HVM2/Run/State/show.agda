module HVM2.Run.State.show where

import HVM2.Net.show as Net
import HVM2.Term.show as Term
import Base.OrdMap.to-list as OrdMap
open import Base.Bits.Type
open import Base.List.Type
open import Base.List.map
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.String.Type
open import Base.String.append
open import Base.String.join
open import HVM2.Run.State.Type
open import HVM2.Term.Type

-- Converts a substitution (Pair Bits Term) to its string representation.
show-subst : Pair String Term -> String
show-subst pair = (fst pair) ++ " -> " ++ Term.show (snd pair)

-- Converts an HVM2 State to its string representation.
-- - state: The HVM2 State to convert.
-- = A string representation of the HVM2 State.
show : State -> String
show state = do
  let net-str    = "GNet:\n" ++ Net.show (State.gnet state)
  let subst-list = OrdMap.to-list (State.subs state)
  let subst-strs = map show-subst subst-list
  let subst-str  = "Subs:\n" ++ join "\n" subst-strs
  net-str ++ "\n\n" ++ subst-str
