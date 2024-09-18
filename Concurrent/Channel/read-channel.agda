module Concurrent.Channel.read-channel where

open import Data.IO.Type
open import Concurrent.Channel.Type
open import Data.Maybe.Type

-- Reads a value from a channel.
-- - channel: The Channel from which to read a value.
-- = An IO action that, when executed, reads and returns a value from the channel.
postulate
  read-channel : ∀ {A : Set} → Channel A → IO (Maybe A)

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# FOREIGN GHC import qualified System.Timeout as ST #-}
{-# COMPILE GHC read-channel = \_ chan -> ST.timeout (fromIntegral 100) (CC.readChan chan) #-}
