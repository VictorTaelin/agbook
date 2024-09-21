module UG.Chat.Client.time where

open import UG.SIPD.FFI.now
open import UG.Chat.Client.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.pure
open import Data.Nat.Type
open import Data.Nat.add

time : Client → IO Nat
time client = do
  current-time <- now
  let offset = Client.server-time-offset client
  pure (current-time + offset)
