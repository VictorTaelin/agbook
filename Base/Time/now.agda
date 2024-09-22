module Base.Time.now where

open import Base.Nat.Type
open import Base.IO.Type

postulate now : IO Nat

{-# FOREIGN GHC import qualified Base.Time.Clock.POSIX as Time #-}
{-# COMPILE GHC now = fmap (fromIntegral . round) Time.getPOSIXTime #-}

