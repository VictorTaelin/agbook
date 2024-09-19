module Bend.Net.Node.set where

open import Base.Maybe.Type
open import Base.Nat.Type
open import Bend.Net.Node.Type
open import Bend.Net.Port.Type
open import Bend.Net.NodeKind.Type

set : Node → Nat → Port → Maybe Node
set node 0 port = Some (record node { main = port })
set node 1 port = Some (record node { aux1 = port })
set node 2 port = Some (record node { aux2 = port })
set node _    _ = None
