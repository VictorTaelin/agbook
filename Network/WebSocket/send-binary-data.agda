module Network.WebSocket.send-binary-data where

open import Network.WebSocket.WSConnection
open import Base.String.Type
open import Base.IO.Type
open import Base.Unit.Type
open import Base.ByteString.Type

-- Sends text data over a WebSocket connection.
-- - conn: The WebSocket connection to send data through.
-- - msg: The text message to be sent.
-- = An asynchronous operation that sends the text data and returns nothing.
postulate
  send-binary-data : WSConnection -> ByteString -> IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-binary-data = \conn msg -> WS.sendBinaryBase conn msg #-}
