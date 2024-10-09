module UG.Chat.Client.sync-time where

import Base.Word8.from-nat as Word8
import UG.Chat.Message.to-nat as Message
open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Network.WebSocket.send-binary-data
open import Base.Pair.Pair
open import Base.Time.now
open import Base.Unit.Unit
open import UG.Chat.Client.Client
open import UG.Chat.Message.Message

-- Prepares a PING message for time synchronization and updates the client's last ping time.
-- This function is part of the time synchronization process between the client and server.
-- - client: The current Client record.
-- = Returns an IO action that, when executed, will:
--   1. Create a PING message as a ByteString.
--   2. Update the client's last-ping-time with the current time.
--   3. Return a pair containing:
--      - The updated Client record.
--      - The PING message as a ByteString, ready to be sent to the server.
sync-time : Client → IO (Pair Client ByteString)
sync-time client = do
  let message-type = Word8.from-nat (Message.to-nat PING)
  let empty = pack-string ""
  let buffer = cons message-type empty
  send-time <- now
  pure (record client { last-ping-time = send-time } , buffer)

