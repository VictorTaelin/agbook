module Concurrent.Channel.read-channel where

open import Data.IOAsync.Type
open import Concurrent.Channel.Type

postulate
  read-channel : ∀ {A : Set} → Channel A → IOAsync A

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC read-channel = \_ -> CC.readChan #-}
