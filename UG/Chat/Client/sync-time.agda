module UG.Chat.Client.sync-time where

open import UG.Chat.Client.Type
open import UG.Chat.Message.message-to-nat
open import UG.Chat.Message.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.pure
open import Data.Unit.Type
open import UG.SIPD.FFI.now
open import Network.WebSocket.send-binary-data
open import UG.SIPD.FFI.nat-to-word8
open import UG.SIPD.FFI.cons
open import UG.SIPD.FFI.pack

sync-time : Client -> IO Client
sync-time client = do
  let message-type = nat-to-word8 (message-to-nat PING)
  let empty = pack ""
  let buffer = cons message-type empty
  send-time <- now
  _ <- send-binary-data (Client.ws client) buffer
  pure (record client { last-ping-time = send-time })
