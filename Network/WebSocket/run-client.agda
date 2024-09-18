module Network.WebSocket.run-client where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IOAsync.Type
open import Data.Unit.Type
open import Data.Int.Type

-- Runs a WebSocket client application.
-- - host: The hostname of the WebSocket server to connect to.
-- - port: The port number of the WebSocket server.
-- - path: The path on the server to connect to.
-- - app: The client application function that takes a WSConnection and performs actions.
-- = An asynchronous operation that runs the client and returns nothing.
postulate
  run-client : String → Int → String → (WSConnection → IOAsync Unit) → IOAsync Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC run-client = \host port path app -> WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn -> app conn) #-}
