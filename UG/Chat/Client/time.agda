module UG.Chat.Client.time where

open import Base.IO.ALL
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Time.now
open import UG.Chat.Client.Client

time : Client -> IO Nat
time client = do
  current-time <- now
  let offset = Client.server-time-offset client
  pure (current-time + offset)
