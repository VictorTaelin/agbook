module Data.WebSocket.Client where

open import Data.String.Type 
open import Data.Maybe.Type
open import Data.IO.Type
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Function.case
open import Data.Maybe.bind
open import Data.IO.bind
open import Data.IO.pure

postulate
  WSConnection : Set
  wsConnect : String → IO (Maybe WSConnection)
  wsSend : WSConnection → String → IO Bool
  wsReceive : WSConnection → IO (Maybe String)
  wsClose : WSConnection → IO Bool

-- Define the WebSocket connection state
data ConnectionState : Set where
  Disconnected : ConnectionState
  Connected : WSConnection → ConnectionState

-- Define the WebSocket client record
record WebSocketClient : Set where
  field
    url : String
    state : ConnectionState

-- Create a new WebSocket client
newClient : String → WebSocketClient
newClient url = record { url = url; state = Disconnected }

-- Connect to the WebSocket server
connect : WebSocketClient → IO (Maybe WebSocketClient)
connect client = do
  maybeConn ← wsConnect (WebSocketClient.url client)
  pure (case maybeConn of λ where
    Nothing → Nothing
    (Some conn) → Some (record { url = WebSocketClient.url client; state = Connected conn }))

-- Send a message through the WebSocket
send : WebSocketClient → String → IO (Maybe WebSocketClient)
send client message = case WebSocketClient.state client of λ where
  Disconnected → pure Nothing
  (Connected conn) → do
    success ← wsSend conn message
    pure (if success
          then Some client
          else Nothing)

-- Receive a message from the WebSocket
receive : WebSocketClient → IO (Maybe (Pair String WebSocketClient))
receive client = case WebSocketClient.state client of λ where
  Disconnected → pure Nothing
  (Connected conn) → do
    maybeMsg ← wsReceive conn
    pure (case maybeMsg of λ where
      Nothing → Nothing
      (Some msg) → Some (msg , client))

-- Close the WebSocket connection
close : WebSocketClient → IO WebSocketClient
close client = case WebSocketClient.state client of λ where
  Disconnected → pure client
  (Connected conn) → do
    _ ← wsClose conn
    pure (record { url = WebSocketClient.url client; state = Disconnected })

