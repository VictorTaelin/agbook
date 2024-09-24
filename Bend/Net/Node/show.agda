module Bend.Net.Node.show where

open import Base.String.Type
open import Base.String.append
open import Base.Nat.Trait.Show
open import Base.Bits.Trait.Show
open import Base.Trait.Show
open import Bend.Net.Node.Type
open import Bend.Net.Port.Type
open import Bend.Net.Port.show
open import Bend.Net.NodeKind.Type
open import Bend.Net.NodeKind.show

instance
  ShowNode : Show Node
  ShowNode = record { to-string = show-node }
    where
      show-node : Node -> String
      show-node (MkNode main aux1 aux2 kind) =
        "[" ++ show  kind ++ " " ++
        show main ++ " " ++
        show aux1 ++ " " ++
        show aux2 ++ "]"
