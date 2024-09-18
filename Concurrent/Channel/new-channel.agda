module Concurrent.Channel.new-channel where

open import Data.IOAsync.Type
open import Concurrent.Channel.Type

postulate
  new-channel : ∀ {A : Set} → IOAsync (Channel A)

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC new-channel = \_ -> CC.newChan #-}
