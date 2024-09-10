module Data.WebSocket.Main where

open import Data.WebSocket.Client
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.print
open import Data.Maybe.Type
open import Data.String.Type
open import Data.String.append
open import Data.Function.case
open import Data.Unit.Type
open import Data.Bool.Type

-- Function to continuously receive messages
receive_loop : WSConnection → IO Unit
receive_loop conn = do
  msg ← ws_receive conn
  case msg of λ where
    (Some message) → do
      print ("Received: " ++ message)
      receive_loop conn
    None → print "Connection closed or error occurred."

-- Main function that creates a WebSocket connection and starts receiving messages
main : IO Unit
main = do
  --let server_url = "wss://echo.websocket.org"
  let server_url = "ws://localhost"
  print ("Connecting to " ++ server_url)
  connection ← ws_connect server_url
  case connection of λ where
    (Some conn) → do
      print "Connection established successfully!"
      receive_loop conn
    None → print "Failed to establish connection."
