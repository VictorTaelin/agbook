module Network.WebSocket.send-text-data where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IOAsync.Type
open import Data.Unit.Type

-- Sends text data over a WebSocket connection.
-- - conn: The WebSocket connection to send data through.
-- - msg: The text message to be sent.
-- = An asynchronous operation that sends the text data and returns nothing.
postulate
  send-text-data : WSConnection → String → IOAsync Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-text-data = \conn msg -> WS.sendTextData conn msg #-}
