module UG.Chat.Message.Type where

open import Data.Nat.Type

data Message : Set where
  JOIN : Message
  EXIT : Message
  POST : Message
  DATA : Message
  TIME : Message
  PING : Message
  PONG : Message

