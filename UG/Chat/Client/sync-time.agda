module UG.Chat.Client.sync-time where

open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.pack-string
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.IO
open import Base.Pair.Pair
open import Base.Time.now
open import Base.Unit.Unit
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Client
open import UG.Chat.Message.Message
open import UG.Chat.Message.to-nat

sync-time : Client -> IO (Pair Client ByteString)
sync-time client = do
  let message-type = from-nat (to-nat PING)
  let empty = pack-string ""
  let buffer = cons message-type empty
  send-time <- now
  pure (record client { last-ping-time = send-time } , buffer)
