
module Bend.Net.Node.Type where

open import Bend.Net.Port.Type
open import Bend.Net.NodeKind.Type

record Node : Set where
  constructor MkNode
  field
    main : Port
    aux1 : Port
    aux2 : Port
    kind : NodeKind
