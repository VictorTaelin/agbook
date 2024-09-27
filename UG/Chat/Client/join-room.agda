module UG.Chat.Client.join-room where

open import Base.ByteString.cons
open import Base.ByteString.ByteString
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

join-room : Nat -> ByteString
join-room room = do
  let message-type = from-nat (to-nat JOIN)
  let buffer = cons message-type (pack-string "")
  let buffer = write-u48 buffer 1 room
  buffer
