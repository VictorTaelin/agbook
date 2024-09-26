module HVM1.Net.Net where

import Base.BitMap.BitMap as M
open import HVM1.Node.Node

-- Represents a net of nodes in the HVM1 system
record Net : Set where
  constructor MkNet
  field
    net : M.BitMap Node
