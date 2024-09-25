module UG.Chat.Client.exit-room where

open import Base.ByteString.cons
open import Base.ByteString.write-u48
open import Base.ByteString.pack-string
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.Type
open import Base.Nat.Type
open import Base.ByteString.Type
open import Base.Unit.Type
open import Base.Word8.from-nat
open import Network.WebSocket.send-binary-data
open import UG.Chat.Client.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.Type
open import UG.Chat.Message.to-nat

exit-room : Client -> Nat -> ByteString
exit-room client room = do
  let message-type = from-nat (to-nat EXIT)
  let buffer = cons message-type (pack-string "")
  let b = write-u48 buffer 1 room
  b
