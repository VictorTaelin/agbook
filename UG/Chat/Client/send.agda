module UG.Chat.Client.send where

open import Data.Nat.Type
open import Data.IO.Type
open import UG.Chat.Message.Type

send : Client -> Nat -> ByteString -> IO Unit
send client room msg = do
  let message-type = from-nat (message-type-to-nat POST)
  -- room is a nat and we need it as u48? not sure what nats are
  let buffer = cons message-type room msg
  _ <- send-binary-data (Client.conn client) buffer
  pure unit
  

