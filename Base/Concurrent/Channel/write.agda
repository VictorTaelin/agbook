module Base.Concurrent.Channel.write where

open import Base.Concurrent.Channel.Channel
open import Base.IO.IO
open import Base.Unit.Unit

-- Writes a value to a channel for asynchronous communication.
-- - channel: The Channel to which the value will be written.
-- - value: The value to be written to the channel.
-- = An IO action that, when executed, writes the value to the channel and returns Unit.
postulate write : ∀ {A : Set} → Channel A → A → IO Unit

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# COMPILE GHC write = \_ -> CC.writeChan #-}

