module UG.SIPD.Event.Click.show where

open import Base.String.String
open import UG.SIPD.Event.Click.Click

-- Converts a Click event to its string representation.
-- - click: The Click event to convert.
-- = A string representation of the Click event.
show : Click -> String
show LeftButton  = "LeftButton"
show RightButton = "RightButton"
