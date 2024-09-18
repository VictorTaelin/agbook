module Concurrent.Channel.Type where

postulate
  Channel : Set → Set

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC Channel = type CC.Chan #-}

