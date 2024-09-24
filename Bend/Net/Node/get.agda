module Bend.Net.Node.get where

open import Base.Maybe.Type
open import Base.Nat.Type
open import Bend.Net.Node.Type
open import Bend.Net.Port.Type
open import Bend.Net.NodeKind.Type

get : Node -> Nat -> Maybe Port
get node 0 = Some (Node.main node)
get node 1 = Some (Node.aux1 node)
get node 2 = Some (Node.aux2 node)
get node _ = None
