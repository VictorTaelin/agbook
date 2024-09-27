module UG.Chat.Client.handle-pong where

open import Base.Bool.if
open import Base.ByteString.ByteString
open import Base.ByteString.read-u48
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.div
open import Base.Nat.lt
open import Base.Nat.sub
open import Base.Time.now
open import Base.U64.U64
open import Base.U64.from-nat
open import UG.Chat.Client.Client
open import UG.Chat.Client.sync-time

-- Handles the PONG message from the server
-- - client: The current client state
-- - data: The received ByteString data
-- = An IO action that returns the updated client state
handle-pong : Client -> ByteString -> IO Client
handle-pong client msg = do
  receive-time <- now
  let server-time = read-u48 msg 1
  let ping = receive-time - Client.last-ping-time client

  let new-offset = (server-time - receive-time) + (div ping 2)
  let new-client = 
        if ping < Client.best-ping client
          then record client { best-ping = ping ; server-time-offset = new-offset }
          else client

  _ <- sync-time new-client
  pure new-client
