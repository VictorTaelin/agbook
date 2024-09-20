module UG.Chat.Client.sync-time where

open import UG.Chat.Client.Type
open import Data.IO.Type
open import Data.Unit.Type

sync-time : UwUChat2Client -> IO UwUChat2Client
sync-time client = do
  let message-type = from-nat (message-type-to-nat PING)
  let buffer = message-type
  let send-time = now
  _ <- send-binary-data (UwUChat2Client.ws client) buffer
  pure (record client { last-ping-time = send-time })


