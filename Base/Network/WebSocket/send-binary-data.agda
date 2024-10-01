module Base.Network.WebSocket.send-binary-data where

open import Base.ByteString.ByteString
open import Base.IO.IO
open import Base.Network.WebSocket.WSConnection
open import Base.String.String
open import Base.Unit.Unit

-- Sends text data over a WebSocket connection.
-- - conn: The WebSocket connection to send data through.
-- - msg: The text message to be sent.
-- = An asynchronous operation that sends the text data and returns nothing.
postulate send-binary-data : WSConnection → ByteString → IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-binary-data = \conn msg -> WS.sendBinaryData conn msg #-}
