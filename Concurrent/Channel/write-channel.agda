module Concurrent.Channel.write-channel where

open import Data.IOAsync.Type
open import Data.Unit.Type
open import Concurrent.Channel.Type

postulate
  write-channel : ∀ {A : Set} → Channel A → A → IOAsync Unit

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC write-channel = \_ -> CC.writeChan #-}
