module UG.Chat.Client.sync-time where

open import Base.ByteString.Type
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.Type
open import Base.Pair.Type
open import Base.Time.now
open import Base.Unit.Type
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.to-nat

sync-time : Client -> IO (Pair Client ByteString)
sync-time client = do
  let message-type = from-nat (to-nat PING)
  let empty = pack-string ""
  let buffer = cons message-type empty
  send-time <- now
  pure (record client { last-ping-time = send-time } , buffer)
