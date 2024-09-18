module Network.Main where

open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show
open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.print
open import Data.IO.seq
open import Data.IO.pure
open import Data.Result.Type
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Int.Type
open import Data.String.Type
open import Data.String.append
open import Data.Maybe.Type
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-data
open import Concurrent.Channel.Type
open import Concurrent.Channel.new-channel
open import Concurrent.Channel.read-channel
open import Concurrent.Channel.write-channel
open import Network.WebSocket.run-concurrent-client


handleWebSocket : Channel String → WSConnection → IO Unit
handleWebSocket chan conn = do
  msg ← receive-data conn
  write-channel chan msg
  handleWebSocket chan conn

processMessages : Channel String → IO Unit
processMessages chan = do
  msg ← read-channel chan
  let parseResult = parse-json-string msg
  handleParseResult parseResult
  processMessages chan
  where
    handleParseResult : Result (Reply JSON) Error → IO Unit
    handleParseResult (Done reply) = 
      print ("Received and parsed JSON: " ++ show (Reply.value reply))
    handleParseResult (Fail error) = 
      print ("Failed to parse JSON")

main : IO Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"
  
  chan ← new-channel

  print ("Connecting to WebSocket server")
  run-concurrent-client host port path (handleWebSocket chan)

  print "Started WebSocket client in separate thread"
  processMessages chan

