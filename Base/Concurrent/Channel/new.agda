module Base.Concurrent.Channel.new where

open import Base.Concurrent.Channel.Channel
open import Base.IO.IO

-- Creates a new channel for asynchronous communication.
-- A: The type of values that will be communicated through the channel.
-- = An IO action that, when executed, creates and returns a new Channel.
postulate new : ∀ {A : Set} → IO (Channel A)

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC new = \_ -> CC.newChan #-}

