module Concurrent.Channel.new where

open import Base.IO.Type
open import Concurrent.Channel.Type

-- Creates a new channel for asynchronous communication.
-- A: The type of values that will be communicated through the channel.
-- = An IO action that, when executed, creates and returns a new Channel.
postulate new : ∀ {A : Set} → IO (Channel A)

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC new = \_ -> CC.newChan #-}
