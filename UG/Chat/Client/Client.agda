module UG.Chat.Client.Client where

open import Base.BitMap.BitMap
open import Base.Nat.Nat
open import Base.String.String
open import Network.WebSocket.WSConnection

record Client : Set where
  field
    server-time-offset : Nat
    best-ping : Nat
    last-ping-time : Nat


