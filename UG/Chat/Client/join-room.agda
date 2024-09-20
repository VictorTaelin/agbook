module UG.Chat.Client.join-room where

open import UG.Chat.Client.Type
open import Data.IO.Type
open import Data.Unit.Type

join-room : Client -> Nat -> IO Unit
join-room client room = do
  let message-type = from-nat (message-type-to-nat JOIN)
  let buffer = cons message-type room
  _ <- send-binary-data (conn client) buffer0
  pure unit
