module Bend.Net.Node.Node where

open import Bend.Net.Port.Port
open import Bend.Net.NodeKind.NodeKind

record Node : Set where
  constructor MkNode
  field
    main : Port
    aux1 : Port
    aux2 : Port
    kind : NodeKind

