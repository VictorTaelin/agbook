module UG.Chat.Client.Client where

open import Base.BinMap.BinMap
open import Base.Nat.Nat
open import Base.Network.WebSocket.WSConnection
open import Base.String.String

record Client : Set where
  field
    server-time-offset : Nat
    best-ping : Nat
    last-ping-time : Nat


