module UG.Chat.Client.recv where

open import UG.Chat.Client.Type
open import client
open import UG.Chat.Message.Type
open import UG.Chat.Message.message-to-nat
open import Data.Nat.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.pure
open import Data.Unit.Type
open import UG.Chat.Message.Type
open import Network.WebSocket.send-binary-data

postulate
  read-uint48-be : ByteString → Nat → Nat
  slice : ByteString → Nat → ByteString
  forEach : {A : Set} → Map A → (A → IO Unit) → IO Unit

handle-message : Client → ByteString → IO Unit
handle-message client data with head data
... | natToWord8 (message-to-nat DATA) = do
  let room = read-uint48-be data 1
      time = read-uint48-be data 7
      msg = slice data 13
  handle-room-message client room msg
... | natToWord8 (message-to-nat PONG) = handle-pong client data
... | _ = pure unit

handle-room-message : Client → Nat → ByteString → IO Unit
handle-room-message client room msg with lookup room (Client.rooms client)
... | just callbacks = forEach callbacks (λ callback → callback msg)
... | nothing = pure unit

postulate
  handle-pong : Client → ByteString → IO Unit
