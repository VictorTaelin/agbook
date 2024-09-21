module client where

open import Data.String.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.split-digits
open import Data.Nat.div
open import Data.Nat.mul
open import Data.Nat.add
open import Data.Nat.mod
open import Data.Nat.show renaming (show to nshow)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.print
open import Data.IO.pure
open import Data.IO.seq
open import Data.List.Type
open import Data.List.append renaming (_++_ to _l++_)
open import Data.List.show renaming (show to lshow)
open import Data.Int.Type
open import Network.WebSocket.WSConnection
open import Network.WebSocket.run-client
open import Network.WebSocket.send-binary-data
open import Network.WebSocket.receive-binary-data
open import UG.SIPD.FFI.now
open import UG.SIPD.FFI.ByteString
open import UG.SIPD.FFI.Word8
open import UG.SIPD.FFI.cons
open import UG.SIPD.FFI.pack
open import UG.SIPD.FFI.head
open import UG.SIPD.FFI.tail
open import UG.SIPD.FFI.show
open import UG.SIPD.FFI.nat-to-word8
open import UG.Chat.Client.Type
open import UG.Chat.Client.send

pingMessageType : Word8
pingMessageType = nat-to-word8 1

nat-to-bytes : Nat → List Nat
nat-to-bytes 0 = []
nat-to-bytes n = nat-to-bytes (div n 256) l++ ( mod n 256 :: [])

bytes-to-u48 : List Nat → Nat
bytes-to-u48 [] = 0
bytes-to-u48 (x :: xs) = go 1 x xs
  where
    go : Nat → Nat → List Nat → Nat
    go 6 acc _ = acc
    go n acc [] = acc
    go n acc (y :: ys) = go (Succ n) ((acc * 256) + y) ys

syncTime : WSConnection -> IO Unit
syncTime conn = do
  let stringData = pack "abc"
      buffer = cons pingMessageType stringData
  sendTime <- now
  _ <- send-binary-data conn buffer
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
  msg <- receive-binary-data conn
  _ <- handleMessage conn msg
  receiveLoop conn

create-client : WSConnection -> Client
create-client conn = record
  { ws = conn
  ; server-time-offset = 0
  ; best-ping = 0
  ; last-ping-time = 0
  }

splitted : List Nat
splitted = nat-to-bytes 258

bytes-to-w8 : List Nat -> ByteString
bytes-to-w8 (a :: b :: c :: d :: e :: f :: _) =
  cons (nat-to-word8 a) (cons (nat-to-word8 b) (cons (nat-to-word8 c) 
       (cons (nat-to-word8 d) (cons (nat-to-word8 e) (cons (nat-to-word8 f) 
       (pack ""))))))
bytes-to-w8 _ = pack ""


main : IO Unit
main = do
  _ <- print "Connecting to WebSocket server..."
  run-client "127.0.0.1" (Pos 8080) "/" λ conn -> do
    _ <- print "Connected to WebSocket server"
    _ <- syncTime conn
    let c = create-client conn
    print ( lshow splitted )
    _ <- send c 1 (pack "hey")
    _ <- print "Sync time message sent"
    receiveLoop conn
