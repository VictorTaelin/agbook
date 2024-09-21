module UG.SIPD.FFI.now where

open import Data.Nat.Type
open import Data.IO.Type

postulate now : IO Nat

{-# FOREIGN GHC import qualified Data.Time.Clock.POSIX as Time #-}
{-# COMPILE GHC now = fmap (fromIntegral . round) Time.getPOSIXTime #-}

