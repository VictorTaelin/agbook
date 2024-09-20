module UG.Chat.Client.Type where

open import Data.String.Type
open import Data.Float.Type

postulate
  WebSocket : Set
  Room : Set
  Recv : Set
  Map : Set -> Set -> Set

record UwUChat2Client : Set where
  field
    ws : WebSocket
    rooms : Map Room Recv
    server-time-offset : Float
    best-ping : Float
    last-ping-time : Float


