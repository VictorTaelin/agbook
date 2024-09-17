module HVM1.Run.link where

import HVM1.Net.link
open import Data.Unit.Type
open import HVM1.Net.Type
open import HVM1.Port.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.mut-state

link : Port → Port → Run Unit
link a b = mut-state λ state →
  record state { net = HVM1.Net.link.link (State.net state) a b }
