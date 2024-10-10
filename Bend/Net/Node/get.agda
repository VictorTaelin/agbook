module Bend.Net.Node.get where

open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Bend.Net.Node.Node
open import Bend.Net.Port.Port
open import Bend.Net.NodeKind.NodeKind

get : Node → Nat → Maybe Port
get node 0 = Some (Node.main node)
get node 1 = Some (Node.aux1 node)
get node 2 = Some (Node.aux2 node)
get node _ = None

