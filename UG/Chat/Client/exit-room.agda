module UG.Chat.Client.exit-room where

open import UG.Chat.Client.Type
open import Data.IO.Type
open import Data.Unit.Type

exit-room : Client -> Nat -> IO Unit
exit-room client room = do
  let message-type = from-nat (message-type-to-nat EXIT)
  let buffer = cons message-type room
  _ <- send-binary-data (conn client) buffer0
  pure unit
