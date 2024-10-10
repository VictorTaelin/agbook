module UG.SIPD.Event.Click.eq where

open import Base.Bool.Bool
open import UG.SIPD.Event.Click.Click

-- Checks if two Click events are equal.
-- - c1: The fst Click event to compare.
-- - c2: The snd Click event to compare.
-- = True if the Click events are equal, False otherwise.
eq : Click → Click → Bool
eq LeftButton LeftButton   = True
eq RightButton RightButton = True
eq _ _                     = False

-- Defines the infix operator _==_ for Click equality
_==_ : Click → Click → Bool
_==_ = eq

infix 4 _==_

