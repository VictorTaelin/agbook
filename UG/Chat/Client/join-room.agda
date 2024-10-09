module UG.Chat.Client.join-room where

import Base.Word8.from-nat as Word8
import UG.Chat.Message.to-nat as Message
open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.ByteString.write-u48
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Nat.Nat
open import Base.Network.WebSocket.send-binary-data
open import Base.Unit.Unit
open import UG.Chat.Client.Client
open import UG.Chat.Message.Message

-- Constructs a ByteString message for joining a chat room.
-- - room: The room ID to join.
-- = Returns a ByteString containing the JOIN message type and the room ID.
join-room : Nat → ByteString
join-room room = do
  let message-type = Word8.from-nat (Message.to-nat JOIN)
  let buffer = cons message-type (pack-string "")
  let buffer = write-u48 buffer 1 room
  buffer

