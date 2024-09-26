module UG.Chat.Message.to-nat where

open import Base.Nat.Nat
open import UG.Chat.Message.Message

to-nat : Message -> Nat
to-nat JOIN = 0
to-nat EXIT = 1
to-nat POST = 2
to-nat DATA = 3
to-nat TIME = 4
to-nat PING = 5
to-nat PONG = 6

