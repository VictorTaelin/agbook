module UG.SM.StateLogs.StateLogs where

open import UG.SM.Tick.Tick

open import Base.BitMap.BitMap
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Equal.Equal

-- Represents a node in the state log
-- Fields:
--   tick  : The tick at which this state was created
--   keep  : The number of ticks this state should be kept before considering deletion
--   life  : The number of ticks this state has been alive
--   state : The actual state data
--   older : A reference to the previous state node, if any
record StateNode (S : Set) : Set where
  inductive
  constructor MkStateNode
  field
    tick  : Tick
    keep  : Nat
    life  : Nat
    state : S
    older : Maybe (StateNode S)

-- Represents a log of states
-- It's either empty (None) or contains a StateNode
StateLogs : Set → Set
StateLogs S = Maybe (StateNode S)
