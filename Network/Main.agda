module Network.Main where

open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show
open import Network.WebSocket.Client
open import Data.Unit.Type
open import Data.IOAsync.Type
open import Data.IOAsync.bind
open import Data.IOAsync.print
open import Data.IOAsync.seq
open import Data.IOAsync.pure
open import Data.Result.Type
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Int.Type

open import Data.String.Type
open import Data.String.append
open import Data.Maybe.Type

-- Function to handle incoming messages
handleMessage : WSConnection → IOAsync Unit
handleMessage conn = do
  msg ← receiveData conn
  let parseResult = parse-json-string msg
  handleParseResult parseResult
  handleMessage conn
  where
    handleParseResult : Result (Reply JSON) Error → IOAsync Unit
    handleParseResult (Done reply) = 
      print ("Received and parsed JSON: " ++ show (Reply.value reply))
    handleParseResult (Fail error) = do
      print ("Failed to parse JSON")

-- Main function
main : IOAsync Unit
main = do
  let url = "ws://127.0.0.1:8080/"
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"
  
  print ("Connecting to " ++ url)
  runClient host port path λ conn → do
    print "Connected to WebSocket server"
    handleMessage conn

