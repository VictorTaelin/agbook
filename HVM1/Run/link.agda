module HVM1.Run.link where

import HVM1.Net.link
open import Base.Unit.Unit
open import HVM1.Net.Net
open import HVM1.Port.Port
open import HVM1.Run.State.State
open import HVM1.Run.Run
open import HVM1.Run.state-mut

link : Port → Port → Run Unit
link a b = state-mut λ state →
  record state { net = HVM1.Net.link.link (State.net state) a b }
