module Bend.Net.Node.show where

open import Data.String.Type
open import Data.String.append
open import Data.Nat.show
open import Data.Bits.show
open import Data.Trait.Show public
open import Bend.Net.Node.Type
open import Bend.Net.Port.Type
open import Bend.Net.Port.show
open import Bend.Net.NodeKind.Type
open import Bend.Net.NodeKind.show

instance
  ShowNode : Show Node
  ShowNode = record { to-string = show-node }
    where
      show-node : Node → String
      show-node (MkNode main aux1 aux2 kind) =
        "[" ++ show  kind ++ " " ++
        show main ++ " " ++
        show aux1 ++ " " ++
        show aux2 ++ "]"
