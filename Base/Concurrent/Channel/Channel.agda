module Base.Concurrent.Channel.Channel where

-- Represents a channel for asynchronous communication between threads.
postulate Channel : Set → Set

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC Channel = type CC.Chan #-}
