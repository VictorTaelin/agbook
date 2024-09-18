module Network.WebSocket.send-close where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IO.Type
open import Data.Unit.Type

-- Sends a close message to a WebSocket connection.
-- - conn: The WebSocket connection to send the close message to.
-- - msg: The message to send before closing the connection.
-- = An IO action that returns Unit after sending the close message.
postulate
  send-close : WSConnection → String → IO Unit

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-close = \conn msg -> WS.sendClose conn msg #-}
