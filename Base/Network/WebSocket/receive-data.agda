module Base.Network.WebSocket.receive-data where

open import Base.IO.IO
open import Base.Network.WebSocket.WSConnection
open import Base.String.String

-- Receives data from a WebSocket connection.
-- - conn: The WebSocket connection to receive data from.
-- = A string containing the received data.
postulate receive-data : WSConnection → IO String

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Base.Text as T #-}

{-# COMPILE GHC receive-data = \conn -> (WS.receiveBase conn) #-}

