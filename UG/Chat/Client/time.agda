module UG.Chat.Client.time where

open import Base.IO.ALL
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Time.now
open import UG.Chat.Client.Client

-- Calculates the current server time for a given client.
-- This function takes into account the time offset between the client and the server.
-- - client: The Client record containing the server time offset.
-- = An IO action that, when executed, will return the current server time as a Nat.
--   The returned time is in milliseconds since the Unix epoch, adjusted for the server offset.
time : Client → IO Nat
time client = do
  current-time <- now
  let offset = Client.server-time-offset client
  pure (current-time + offset)
