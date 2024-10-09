module UG.SIPD.Action.show where

open import Base.Bool.if
open import Base.String.String
open import Base.String.append
open import UG.SIPD.Action.Action
open import Base.Word8.to-nat
import Base.Nat.show as Nat

-- Converts an Action to its string representation.
-- - action: The Action to convert.
-- = A string representation of the Action.
show : Action → String
show (SetNick time pid nick) = 
  "SetNick " ++ Nat.show time ++ " " ++ Nat.show pid ++ " " ++ nick

