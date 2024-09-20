module client where

open import Agda.Builtin.String using (String)
open import Agda.Builtin.Nat using (Nat)
open import Agda.Builtin.Unit using (⊤)
open import Agda.Builtin.IO using (IO)

-- word8 is a byte that is converted to the Word8 type in haskell
-- in js we dont need the type, we just use the ArrayBuffer functions to integrate correctly
-- for now will postulate through ffi instead of defining a complex type bcs need it fast
-- so we simply need a way to pack things in bytestrings
-- also some way to call date (with getPOSIXTime)
-- And how to mimic the promises structure of the client class?
-- when opening, we sync time
-- we deal with errors
-- we use forkIO with a handleMessage function as we were doing in the gameLoop
-- send is just a call for send, no problem 
-- not sure about the receive, in the  ts version, rooms is a map of rooms to a set of callbacks. I believe you can be connected to multiple rooms and have many callbacks.
-- our receive function also has to call forkIO, the callback we will mimic
-- is a function that correctly handles the returns of the functions through a concurrent channel.
-- Then we have to deal with message format, which has the tag, room and time.
-- and the callback is called for each message. In the game, this is the deserialization of the message and registering it in the state machine. 
-- Deal with u48 writing 
-- maybe we have a word48 or smth, otherwise we create two aux functions as well.


-- Postulates for ByteString and Word8
postulate
  ByteString : Set
  Word8 : Set
  pack : String → ByteString
  cons : Word8 → ByteString → ByteString

-- Postulates for WebSocket functions
postulate
  Connection : Set
  sendBinaryData : Connection → ByteString → IO ⊤
  runClient : String → Nat → String → (Connection → IO ⊤) → IO ⊤

-- Postulate for time function
postulate
  getPOSIXTime : IO Nat

-- Define the message type for PING
pingMessageType : Word8
pingMessageType = 1  -- Assuming 1 represents PING in your case

-- Function to send a PING message with additional data over WebSocket
syncTime : Connection → IO ⊤
syncTime conn = do
  let stringData = pack "abc"
      buffer = cons pingMessageType stringData
  
  sendTime ← getPOSIXTime
  
  _ ← sendBinaryData conn buffer
  
  -- Store the last ping time (analogous to `this.last_ping_time`)
  _ ← putStrLn ("Last ping time: " ++ show sendTime)
  
  return ⊤

main : IO ⊤
main = do
  _ ← putStrLn "Connecting to WebSocket server..."
  runClient "127.0.0.1" 8080 "/" λ conn → do
    _ ← putStrLn "Connected to WebSocket server"
    _ ← syncTime conn
    _ ← putStrLn "Sync time message sent"
    return ⊤

-- Postulate for putStrLn and show
postulate
  putStrLn : String → IO ⊤
  show : Nat → String
