module UG.Chat.Client.Type where

open import Data.String.Type
open import Data.Nat.Type
open import Data.Map.Type
open import Network.WebSocket.WSConnection

--Recv : Set
-- Recv = ByteString -> IO Unit

record Client : Set where
  field
    ws : WSConnection
-- map keys are always bits, we map from a bit (room) to a recv callback
--    rooms : Map Nat
    server-time-offset : Nat
    best-ping : Nat
    last-ping-time : Nat


