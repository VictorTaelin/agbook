module UG.SIPD.Event.serialize where

open import Base.Bool.Bool
open import Base.ByteString.ByteString
open import Base.ByteString.append
open import Base.ByteString.cons
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import Base.ByteString.pack-string-fixed
open import Base.ByteString.write-f64-as-nat
open import Base.List.head
open import Base.List.take
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.from-char
open import Base.String.to-list
open import Base.Word8.Word8
open import Base.Word8.from-nat
open import UG.SIPD.Event.Event
open import UG.SIPD.Action.Action
import UG.SIPD.Action.serialize as Action
import UG.SIPD.Event.Click.serialize as Click


-- Serializes a Bool into a ByteString.
-- - True is serialized as [1], False as [0].
-- - b: The Bool to serialize.
-- = A ByteString representation of the Bool.
serialize-bool : Bool → ByteString
serialize-bool True  = cons (from-nat 1) (pack-string "")
serialize-bool False = cons (from-nat 0) (pack-string "")

-- Serializes an Event into a ByteString.
-- The first byte of the resulting ByteString is a tag indicating the event type:
-- - 0 for KeyEvent
-- - 1 for MouseClick
-- - 2 for MouseMove
-- - event: The Event to serialize.
-- = Some ByteString containing the serialized event if successful, None otherwise.
serialize : Event → Maybe ByteString
serialize (KeyEvent s b) = do
  packed-string <- pack-string-fixed s 1
  let bool-byte = serialize-bool b
  Some (append (cons (from-nat KEYEVENT) packed-string) bool-byte) -- TAG 0

serialize (MouseClick click x y) = do
  let click-byte = Click.serialize click
  let x-bytes = write-f64-as-nat (pack-string "") 0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some (append (cons (from-nat MOUSECLICK) click-byte) xy-bytes) -- TAG 1

serialize (KeyMouse key down x y) = do
  packed-string <- pack-string-fixed key 1
  let bool-byte = serialize-bool down
  let x-bytes = write-f64-as-nat (pack-string "") 0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some (append (append (cons (from-nat KEYMOUSE) packed-string) bool-byte) xy-bytes)

serialize (MouseMove x y) = do
  let initial-bytes = cons (from-nat MOUSEMOVE) (pack-string "") -- TAG 2
  let x-bytes = write-f64-as-nat initial-bytes 1 x
  let xy-bytes = write-f64-as-nat x-bytes 9 y
  Some xy-bytes

serialize (ActionEvent action) = do
  Action.serialize action
