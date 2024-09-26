module Network.WebSocket.receive-binary-data where

open import Base.ByteString.ByteString
open import Base.IO.IO
open import Base.Maybe.Maybe
open import Base.String.String
open import Network.WebSocket.WSConnection

-- Receives binary data from a WebSocket connection with a timeout.
-- - conn: The WebSocket connection to receive data from.
-- = A Maybe ByteString containing the received data, or None if the operation times out.
--   The timeout is set to 100 milliseconds.
postulate receive-binary-data : WSConnection -> IO (Maybe ByteString)

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified System.Timeout as ST #-}

{-# COMPILE GHC receive-binary-data = \conn -> ST.timeout (fromIntegral 100) (WS.receiveData conn) #-}
