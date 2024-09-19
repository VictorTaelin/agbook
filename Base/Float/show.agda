module Base.Float.show where

open import Base.Float.Type
open import Base.String.Type
open import Base.Show.Trait public

-- Compares two Float values for equality
-- Instance of Show typeclass for Float
instance
  ShowFloat : Show Float
  ShowFloat = record { to-string = show-float }
    where
      show-float : Float → String
      show-float = primShowFloat
