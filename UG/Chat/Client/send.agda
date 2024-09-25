module UG.Chat.Client.send where

open import Base.ByteString.Type
open import Base.ByteString.cons
open import Base.ByteString.append
open import Base.ByteString.write-u48
open import Base.ByteString.pack-string
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.Type
open import Base.Nat.Type
open import Base.Unit.Type
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.to-nat

send : Client -> Nat -> ByteString -> ByteString
send client room msg = do
  let message-type = from-nat (to-nat POST)
  let buffer = cons message-type (pack-string "")
  let b = write-u48 buffer 1 room
  b ++ msg
  

