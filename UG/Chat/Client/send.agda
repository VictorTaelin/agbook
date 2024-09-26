module UG.Chat.Client.send where

open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.append
open import Base.ByteString.write-u48
open import Base.ByteString.pack-string
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.IO
open import Base.Nat.Nat
open import Base.Unit.Unit
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Client
open import UG.Chat.Message.Message
open import UG.Chat.Message.Message
open import UG.Chat.Message.to-nat

send : Nat -> ByteString -> ByteString
send room msg = do
  let message-type = from-nat (to-nat POST)
  let buffer = cons message-type (pack-string "")
  let b = write-u48 buffer 1 room
  b ++ msg
  

