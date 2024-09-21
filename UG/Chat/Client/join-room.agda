module UG.Chat.Client.join-room where

open import UG.Chat.Client.Type
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
open import UG.SIPD.FFI.nat-to-word8
open import UG.SIPD.FFI.cons
open import UG.SIPD.FFI.pack

join-room : Client -> Nat -> IO Unit
join-room client room = do
  let message-type = nat-to-word8 (message-to-nat JOIN)
  let buffer = cons message-type (cons (nat-to-word8 room) (pack ""))
  _ <- send-binary-data (Client.ws client) buffer
  pure unit
