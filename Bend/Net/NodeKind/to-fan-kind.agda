module Bend.Net.NodeKind.to-fan-kind where

open import Bend.Net.NodeKind.NodeKind
open import Bend.Fun.FanKind.FanKind
open import Base.Result.Result
open import Base.String.String

-- Converts a NodeKind to a FanKind, if possible.
-- - kind: The NodeKind to convert.
-- = A Result containing either the corresponding FanKind or an error message.
to-fan-kind : NodeKind → Result FanKind String
to-fan-kind Con = Done Tup
to-fan-kind Dup = Done Dup
to-fan-kind _   = Fail "Not a fan node"

