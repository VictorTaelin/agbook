module UG.Chat.Client.join-room where

open import UG.Chat.Client.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.to-nat
open import Base.Nat.Type
open import Base.IO.Type
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Unit.Type
open import UG.Chat.Message.Type
open import Network.WebSocket.send-binary-data
open import Base.Word8.from-nat
open import Base.ByteString.cons
open import Base.ByteString.pack-string

join-room : Client -> Nat -> IO Unit
join-room client room = do
  let message-type = from-nat (to-nat JOIN)
  let buffer = cons message-type (cons (from-nat room) (pack-string ""))
  _ <- send-binary-data (Client.ws client) buffer
  pure unit
