module Network.WebSocket.send-binary-data where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IO.Type
open import Data.Unit.Type
open import UG.SIPD.FFI.ByteString

-- Sends text data over a WebSocket connection.
-- - conn: The WebSocket connection to send data through.
-- - msg: The text message to be sent.
-- = An asynchronous operation that sends the text data and returns nothing.
postulate
  send-binary-data : WSConnection -> ByteString -> IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-binary-data = \conn msg -> WS.sendBinaryData conn msg #-}
