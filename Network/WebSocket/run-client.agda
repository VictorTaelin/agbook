module Network.WebSocket.run-client where

open import Base.IO.IO
open import Base.Int.Int
open import Base.String.String
open import Base.Unit.Unit
open import Network.WebSocket.WSConnection

-- Runs a WebSocket client application.
-- - host: The hostname of the WebSocket server to connect to.
-- - port: The port number of the WebSocket server.
-- - path: The path on the server to connect to.
-- - app: The client application function that takes a WSConnection and performs actions.
-- = An asynchronous operation that runs the client and returns nothing.
postulate run-client : String → Int → String → (WSConnection → IO Unit) → IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Base.Text as T #-}

{-# COMPILE GHC run-client = \host port path app -> WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn → app conn) #-}
