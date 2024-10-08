module UG.SIPD.Event.deserialize where

import Base.ByteString.head as BS
import Base.ByteString.tail as BS
import UG.SIPD.Event.Click.deserialize as Click
import UG.SIPD.Action.deserialize as Action
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
open import Base.Maybe.map
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.String.from-char
open import Base.Word8.Word8
open import Base.Word8.to-nat
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.Event.Event

-- Deserializes a Word8 into a Bool.
-- - w: The Word8 to deserialize.
-- = Some True if w is 1, Some False if w is 0, None otherwise.
deserialize-bool : Word8 → Maybe Bool
deserialize-bool w with (to-nat w)
... | 0 = Some False
... | 1 = Some True
... | _ = None

-- Deserializes a ByteString into a KeyEvent.
-- - bs: The ByteString to deserialize.
-- = Some KeyEvent if successful, None otherwise.
deserialize-key-event : ByteString → Maybe Event
deserialize-key-event bs = do
  char <- read-char bs 1
  let key = from-char char
  bool-byte <- Some (BS.head (BS.tail (BS.tail bs)))
  deserialized-bool <- deserialize-bool bool-byte
  Some (KeyEvent key deserialized-bool)

-- Deserializes a ByteString into a MouseClick event.
-- - bs: The ByteString to deserialize.
-- = Some MouseClick if successful, None otherwise.
deserialize-mouse-click : ByteString → Maybe Event
deserialize-mouse-click bs = do
  let click-byte = BS.head (BS.tail bs)
  let x = read-f64 bs 2
  let y = read-f64 bs 8
  deserialized-click <- Click.deserialize click-byte
  Some (MouseClick deserialized-click x y)

deserialize-key-mouse : ByteString → Maybe Event
deserialize-key-mouse bs = do
  char <- read-char bs 1
  let key = from-char char
  bool-byte <- Some (BS.head (BS.tail (BS.tail bs)))
  deserialized-bool <- deserialize-bool bool-byte
  let x = read-f64 bs 3
  let y = read-f64 bs 9
  Some (KeyMouse key deserialized-bool x y)

-- Deserializes a ByteString into a MouseMove event.
-- - bs: The ByteString to deserialize.
-- = Some MouseMove if successful, None otherwise.
deserialize-mouse-move : ByteString → Maybe Event
deserialize-mouse-move bs = do
  let x = read-f64 bs 1
  let y = read-f64 bs 7
  Some (MouseMove x y)

-- Deserializes a ByteString into an Event.
-- - bs: The ByteString to deserialize.
-- = Some Event if successful, None otherwise.
deserialize-helper : ByteString → Maybe Event
deserialize-helper bs = do
  let code = (to-nat (BS.head bs))
  guards
    (((code == KEYEVENT)   , deserialize-key-event bs) ::
     ((code == MOUSECLICK) , deserialize-mouse-click bs) ::
     ((code == KEYMOUSE)   , deserialize-key-mouse bs) ::
     ((code == MOUSEMOVE)  , deserialize-mouse-move bs) :: [])
    (map ActionEvent (Action.deserialize bs))

-- Deserializes a ByteString into an Event, checking for empty ByteString first.
-- - bs: The ByteString to deserialize.
-- = Some Event if successful, None if empty or deserialization fails.
deserialize : ByteString → Maybe Event
deserialize bs with (is-empty bs)
... | True  = None
... | False = deserialize-helper bs

