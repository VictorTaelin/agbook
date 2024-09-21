module Network.WebSocket.receive-binary-data where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IO.Type
open import UG.SIPD.FFI.ByteString

-- Receives binary data from a WebSocket connection.
-- - conn: The WebSocket connection to receive data from.
-- = A byte string containing the received data.
postulate
  receive-binary-data : WSConnection → IO ByteString

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC receive-binary-data = \conn -> (WS.receiveData conn) #-}
