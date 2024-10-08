module UG.SIPD.Action.deserialize where

import Base.ByteString.head as BS
import Base.ByteString.tail as BS
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.ByteString.ByteString
open import Base.ByteString.is-empty
open import Base.ByteString.read-char
open import Base.ByteString.read-f64
open import Base.ByteString.show as BS
open import Base.Function.guards
open import Base.List.List
open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.String.from-char
open import Base.Word8.Word8
open import Base.Word8.to-nat
open import UG.SIPD.Action.Action

deserialize-set-nick : ByteString → Maybe Action
deserialize-set-nick bs = do
  Some (SetNick (BS.show bs))

-- Deserializes a ByteString into an Action.
-- - bs: The ByteString to deserialize.
-- = Some Action if successful, None otherwise.
deserialize-helper : ByteString → Maybe Action
deserialize-helper bs = do
  let code = (to-nat (BS.head bs))
  guards
     (((code == SETNICK) , deserialize-set-nick bs) :: [])
    None

-- Deserializes a ByteString into an Action, checking for empty ByteString first.
-- - bs: The ByteString to deserialize.
-- = Some Action if successful, None if empty or deserialization fails.
deserialize : ByteString → Maybe Action
deserialize bs with (is-empty bs)
... | True  = None
... | False = deserialize-helper bs
