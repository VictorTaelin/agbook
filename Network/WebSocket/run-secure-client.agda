module Network.WebSocket.run-secure-client where

open import Base.IO.IO
open import Base.Int.Int
open import Base.String.String
open import Base.Unit.Unit
open import Network.WebSocket.WSConnection

-- Runs a secure WebSocket client connection.
-- Connects to a secure WebSocket server and executes the provided application.
-- - host: The hostname or IP address of the WebSocket server.
-- - port: The port number on which the WebSocket server is listening.
-- - path: The path component of the WebSocket URL.
-- - app: The application function to run with the established WebSocket connection.
-- = An asynchronous I/O action that performs the secure WebSocket connection and runs the application.
postulate run-secure-client : String → Int → String → (WSConnection → IO Unit) → IO Unit

{-# FOREIGN GHC import qualified Base.Text as T #-}
{-# FOREIGN GHC import qualified Wuss #-}

{-# COMPILE GHC run-secure-client = \host port path app -> Wuss.runSecureClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn → app conn) #-}
