module Network.WebSocket.receive-binary-data where

open import Network.WebSocket.WSConnection
open import Base.String.Type
open import Base.IO.Type
open import Base.ByteString.Type

-- Receives binary data from a WebSocket connection.
-- - conn: The WebSocket connection to receive data from.
-- = A byte string containing the received data.
postulate
  receive-binary-data : WSConnection -> IO ByteString

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC receive-binary-data = \conn -> (WS.receiveBase conn) #-}
