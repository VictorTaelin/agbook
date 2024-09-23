module Network.WebSocket.run-concurrent-client where

open import Base.IO.Type
open import Base.Int.Type
open import Base.String.Type
open import Base.Unit.Type
open import Network.WebSocket.WSConnection

-- Runs a concurrent WebSocket client.
-- - host: The hostname of the WebSocket server.
-- - port: The port number of the WebSocket server.
-- - path: The path to connect to on the WebSocket server.
-- - handler: A function that handles the WebSocket connection.
-- = An asynchronous operation that runs the client concurrently.
postulate
  run-concurrent-client : String -> Int -> String -> (WSConnection -> IO Unit) -> IO Unit

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# FOREIGN GHC import Control.Monad (void)  #-}
{-# FOREIGN GHC import qualified Base.Text as T #-}
{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC run-concurrent-client = \host port path handler -> do
    void $ CC.forkIO $ WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) handler
#-}
