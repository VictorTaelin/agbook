module UG.Chat.Client.time where

open import UG.SIPD.FFI.now
open import UG.Chat.Client.Type
open import Data.Float.Type
open import Data.Nat.Type
open import Data.Nat.add

time : UwUChat2Client → IO Nat
time client = do
  current-time <- now
  let offset = server-time-offset client
  pure (current-time + offset)
