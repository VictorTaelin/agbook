module client where

open import Data.String.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.show renaming (show to nshow)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.print
open import Data.IO.pure
open import Data.IO.seq
open import Data.Int.Type
open import Network.WebSocket.WSConnection
open import Network.WebSocket.run-client
open import UG.SIPD.FFI.now

postulate
  ByteString : Set
  Word8 : Set
  pack : String -> ByteString
  cons : Word8 -> ByteString -> ByteString
  sendBinaryData : WSConnection -> ByteString -> IO Unit
  natToWord8 : Nat -> Word8
  head : ByteString -> Word8
  tail : ByteString -> ByteString
  show : ByteString -> String
  receiveBinaryData : WSConnection -> IO ByteString

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# FOREIGN GHC import qualified Data.Word as W #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Data.Text.Encoding as TE #-}
{-# COMPILE GHC ByteString = type BS.ByteString #-}
{-# COMPILE GHC Word8 = type W.Word8 #-}
{-# COMPILE GHC pack = TE.encodeUtf8 #-}
{-# COMPILE GHC cons = BS.cons #-}
{-# COMPILE GHC sendBinaryData = \conn msg -> WS.sendBinaryData conn msg #-}
{-# COMPILE GHC natToWord8 = fromIntegral #-}
{-# COMPILE GHC head = BS.head #-}
{-# COMPILE GHC tail = BS.tail #-}
{-# COMPILE GHC show = T.pack . show #-}
{-# COMPILE GHC receiveBinaryData = \conn -> WS.receiveData conn #-}

pingMessageType : Word8
pingMessageType = natToWord8 1


syncTime : WSConnection -> IO Unit
syncTime conn = do
  let stringData = pack "abc"
      buffer = cons pingMessageType stringData
  sendTime <- now
  _ <- sendBinaryData conn buffer
  _ <- print ("Last ping time: " ++ nshow sendTime)
  pure unit


handleMessage : WSConnection -> ByteString -> IO Unit
handleMessage conn msg = do
  let messageType = head msg
      dataPart = tail msg
  _ <- print ("Received data: " ++ show dataPart)
  pure unit
  

receiveLoop : WSConnection -> IO Unit
receiveLoop conn = do
  msg <- receiveBinaryData conn
  _ <- handleMessage conn msg
  receiveLoop conn


main : IO Unit
main = do
  _ <- print "Connecting to WebSocket server..."
  run-client "127.0.0.1" (Pos 8080) "/" λ conn -> do
    _ <- print "Connected to WebSocket server"
    _ <- syncTime conn
    _ <- print "Sync time message sent"
    receiveLoop conn


