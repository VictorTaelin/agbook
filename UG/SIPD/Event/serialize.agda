module UG.SIPD.Event.serialize where

open import Base.Bool.Bool
open import Base.ByteString.ByteString
open import Base.ByteString.append
open import Base.ByteString.cons
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import Base.ByteString.pack-string-fixed
open import Base.ByteString.write-u48
open import Base.ByteString.write-f64-as-nat
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.from-char
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
-- - event: The Event to serialize.
-- = Some ByteString containing the serialized event if successful, None otherwise.
serialize : Event → Maybe ByteString
serialize (KeyEvent pid s b) = do
  packed-string <- pack-string-fixed s 1
  let bool-byte = serialize-bool b
  Some ((from-nat KEYEVENT) :: (write-u48 (pack-string "") 0 pid) ++ packed-string ++ bool-byte)

serialize (MouseClick pid click x y) = do
  let click-byte = Click.serialize click
  let x-bytes = write-f64-as-nat (pack-string "") 0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some ((from-nat MOUSECLICK) :: (write-u48 (pack-string "") 0 pid) ++ click-byte ++ xy-bytes)

serialize (KeyMouse pid key down x y) = do
  packed-string <- pack-string-fixed key 1
  let bool-byte = serialize-bool down
  let x-bytes = write-f64-as-nat (pack-string "") 0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some ((from-nat KEYMOUSE) :: (write-u48 (pack-string "") 0 pid) ++ packed-string ++ bool-byte ++ xy-bytes)

serialize (MouseMove pid x y) = do
  let x-bytes = write-f64-as-nat (pack-string "")  0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some ((from-nat MOUSEMOVE) :: (write-u48 (pack-string "") 0 pid) ++ xy-bytes)

serialize (ActionEvent action) = do
  Action.serialize action
