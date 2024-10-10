module Bend.Fun.FanKind.FanKind where

-- Represents the kind of fan: tuple or duplication
data FanKind : Set where
  Tup : FanKind
  Dup : FanKind

