module UG.Chat.Message.Message where

open import Base.Nat.Nat

data Message : Set where
  JOIN : Message
  EXIT : Message
  POST : Message
  DATA : Message
  TIME : Message
  PING : Message
  PONG : Message

