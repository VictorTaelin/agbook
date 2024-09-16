module Bend.Fun.FanKind.Type where

-- Represents the kind of fan: tuple or duplication
data FanKind : Set where
  Tup : FanKind
  Dup : FanKind
