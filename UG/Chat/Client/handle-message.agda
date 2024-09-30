module UG.Chat.Client.handle-message where

import Base.Word8.to-nat as Word8
open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.drop
open import Base.ByteString.head
open import Base.ByteString.pack-string
open import Base.ByteString.read-u48
open import Base.ByteString.write-u48
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Nat.Nat
open import Base.Unit.Unit
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Client
open import UG.Chat.Client.handle-pong
open import UG.Chat.Message.Message
open import UG.Chat.Message.to-nat

-- Handles incoming messages from the server.
-- - client: The current client state.
-- - bs: The received ByteString message.
-- - handle-data-message: A function to handle DATA messages.
-- = An IO action that returns the updated client state after processing the message.
handle-message : Client → ByteString → (Client → Nat → Nat → ByteString → IO Client) → IO Client
handle-message client bs handle-data-message with Word8.to-nat (head bs)
... | 3 = do  -- DATA
  let room = read-u48 bs 1
  let time = read-u48 bs 7
  let msg = drop bs 13
  handle-data-message client room time msg
... | 6 = do  -- PONG
  handle-pong client bs
... | _ = pure client

