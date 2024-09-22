module UG.Chat.Client.sync-time where

open import UG.Chat.Client.Type
open import UG.Chat.Message.to-nat
open import UG.Chat.Message.Type
open import Base.IO.Type
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Unit.Type
open import Base.Time.now
open import Network.WebSocket.send-binary-data
open import Base.Word8.from-nat
open import Base.ByteString.cons
open import Base.ByteString.pack-string

sync-time : Client -> IO Client
sync-time client = do
  let message-type = from-nat (to-nat PING)
  let empty = pack-string ""
  let buffer = cons message-type empty
  send-time <- now
  _ <- send-binary-data (Client.ws client) buffer
  pure (record client { last-ping-time = send-time })
