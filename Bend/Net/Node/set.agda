module Bend.Net.Node.set where

open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Bend.Net.Node.Node
open import Bend.Net.Port.Port
open import Bend.Net.NodeKind.NodeKind

set : Node → Nat → Port → Maybe Node
set node 0 port = Some (record node { main = port })
set node 1 port = Some (record node { aux1 = port })
set node 2 port = Some (record node { aux2 = port })
set node _    _ = None

