module Bend.Net.NodeKind.show where

open import Bend.Net.NodeKind.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.show

instance
  ShowNodeKind : Show NodeKind
  ShowNodeKind = record { to-string = show-node-kind }
    where
      show-node-kind : NodeKind → String
      show-node-kind Rot = "Rot"
      show-node-kind Era = "Era"
      show-node-kind Con = "Con"
      show-node-kind Dup = "Dup"
      show-node-kind Var = "Var"
      show-node-kind (Ref s) = "Ref(\"" ++ s ++ "\")"
      show-node-kind (Num b) = "Num(" ++ show (to-nat b) ++ ")"
      show-node-kind Opr = "Opr"
      show-node-kind Swi = "Swi"
