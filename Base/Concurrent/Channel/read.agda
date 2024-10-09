module Base.Concurrent.Channel.read where

open import Base.Concurrent.Channel.Channel
open import Base.IO.IO
open import Base.Maybe.Maybe

-- Reads a value from a channel.
-- - channel: The Channel from which to read a value.
-- = An IO action that, when executed, reads and returns a value from the channel.
postulate read : ∀ {A : Set} → Channel A → IO (Maybe A)

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# FOREIGN GHC import qualified System.Timeout as ST #-}
{-# COMPILE GHC read = \_ chan -> ST.timeout (fromIntegral 100) (CC.readChan chan) #-}

