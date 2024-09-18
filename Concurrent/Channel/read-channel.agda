module Concurrent.Channel.read-channel where

open import Data.IOAsync.Type
open import Concurrent.Channel.Type

-- Reads a value from a channel.
-- - channel: The Channel from which to read a value.
-- = An IOAsync action that, when executed, reads and returns a value from the channel.
postulate
  read-channel : ∀ {A : Set} → Channel A → IOAsync A

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC read-channel = \_ -> CC.readChan #-}
