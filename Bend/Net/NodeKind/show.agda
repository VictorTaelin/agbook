module Bend.Net.NodeKind.show where

open import Bend.Net.NodeKind.NodeKind
open import Base.String.String
open import Base.String.append
open import Base.Trait.Show
open import Base.Bits.Bits
open import Base.Bits.to-nat
open import Base.Nat.Trait.Show

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
