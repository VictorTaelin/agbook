module Bend.Net.NodeKind.from-fan-kind where

open import Bend.Net.NodeKind.Type using (NodeKind)
open import Bend.Fun.FanKind.Type using (FanKind)

from-fan-kind : FanKind → NodeKind
from-fan-kind FanKind.Tup = NodeKind.Con
from-fan-kind FanKind.Dup = NodeKind.Dup
