module UG.SIPD.Action.eq where

import Base.String.eq as String
open import Base.Bool.Bool
open import Base.String.String
open import UG.SIPD.Action.Action

-- Checks if two Action values are equal.
-- - a1: The fst Action.
-- - a2: The snd Action.
-- = True if the actions are equal, False otherwise.
eq : Action → Action → Bool
eq (SetNick s1) (SetNick s2) = s1 String.== s2

_==_ : Action → Action → Bool
_==_ = eq

infix 4 _==_
