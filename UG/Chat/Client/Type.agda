module UG.Chat.Client.Type where

open import Base.String.Type
open import Base.Nat.Type
open import Base.Map.Type
open import Network.WebSocket.WSConnection

record Client : Set where
  field
    ws : WSConnection
    server-time-offset : Nat
    best-ping : Nat
    last-ping-time : Nat


