module UG.Chat.Message.message-to-nat where

open import Data.Nat.Type
open import UG.Chat.Message.Type

message-to-nat : Message -> Nat
message-to-nat JOIN = 0
message-to-nat EXIT = 1
message-to-nat POST = 2
message-to-nat DATA = 3
message-to-nat TIME = 4
message-to-nat PING = 5
message-to-nat PONG = 6

