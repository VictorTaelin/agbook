module Network.Main where

open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show
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
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-data


postulate
  Chan : Set → Set
  newChan : ∀ {A : Set} → IOAsync (Chan A)
  writeChan : ∀ {A : Set} → Chan A → A → IOAsync Unit
  readChan : ∀ {A : Set} → Chan A → IOAsync A

postulate
  runClientWithHandler : String → Int → String → (WSConnection → IOAsync Unit) → IOAsync Unit

{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# FOREIGN GHC import Control.Monad (void)  #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# COMPILE GHC Chan = type CC.Chan #-}
{-# COMPILE GHC newChan = \_ -> CC.newChan #-}
{-# COMPILE GHC writeChan = \_ -> CC.writeChan #-}
{-# COMPILE GHC readChan = \_ -> CC.readChan #-}

{-# COMPILE GHC runClientWithHandler = \host port path handler -> do
    void $ CC.forkIO $ WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) handler
#-}

handleWebSocket : Chan String → WSConnection → IOAsync Unit
handleWebSocket chan conn = do
  msg ← receive-data conn
  writeChan chan msg
  handleWebSocket chan conn

processMessages : Chan String → IOAsync Unit
processMessages chan = do
  msg ← readChan chan
  let parseResult = parse-json-string msg
  handleParseResult parseResult
  processMessages chan
  where
    handleParseResult : Result (Reply JSON) Error → IOAsync Unit
    handleParseResult (Done reply) = 
      print ("Received and parsed JSON: " ++ show (Reply.value reply))
    handleParseResult (Fail error) = 
      print ("Failed to parse JSON")

main : IOAsync Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"
  
  chan ← newChan

  print ("Connecting to WebSocket server")
  runClientWithHandler host port path (handleWebSocket chan)

  print "Started WebSocket client in separate thread"
  processMessages chan

