module UG.Chat.Client.send where

import Base.Word8.from-nat as Word8
import UG.Chat.Message.to-nat as Message
open import Base.ByteString.ByteString
open import Base.ByteString.append
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.ByteString.write-u48
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Nat.Nat
open import Base.Unit.Unit
open import Network.WebSocket.send-binary-data
open import UG.Chat.Message.Message

-- Constructs a ByteString message for sending a POST message to a chat room.
-- - room: The room ID to send the message to.
-- - msg: The message content as a ByteString.
-- = Returns a ByteString containing the POST message type, room ID, and message content.
send : Nat -> ByteString -> ByteString
send room msg = do
  let message-type = Word8.from-nat (Message.to-nat POST)
  let buffer = cons message-type (pack-string "")
  let buffer = write-u48 buffer 1 room
  buffer ++ msg
