module Base.Time.now where

open import Base.Nat.Type
open import Base.IO.Type

-- Returns the current time as a natural number.
-- The value represents the number of milliseconds elapsed since the Unix epoch
-- (January 1, 1970, 00:00:00 UTC).
-- = An IO action that, when executed, will return the current time in milliseconds.
postulate now : IO Nat

{-# FOREIGN GHC import qualified Data.Time.Clock.POSIX as Time #-}
{-# COMPILE GHC now = fmap (\t -> round (t * 1000)) Time.getPOSIXTime #-}
