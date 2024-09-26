module UG.SIPD.Event.Event where

open import Base.Bool.Bool
open import Base.F64.F64
open import Base.String.String
open import UG.SIPD.Event.Click

data Event : Set where
  KeyEvent : String -> Bool -> Event
  MouseClick : Click -> F64 → F64 → Event
  MouseMove : F64 -> F64 -> Event 


{-# FOREIGN GHC
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.Event.Click

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double
#-}

{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}

open import Base.ByteString.ByteString
open import Base.ByteString.pack-string
open import Base.ByteString.append
open import Base.ByteString.cons
open import Base.String.to-list
open import Base.String.from-char
open import Base.List.take
open import Base.Word8.Word8
open import Base.Word8.to-nat
open import Base.List.head
import Base.ByteString.head as BS
import Base.ByteString.tail as BS
open import Base.ByteString.pack
open import Base.Nat.Nat
open import Base.Function.case
open import Base.ByteString.write-u48
open import Base.ByteString.write-f64-as-nat
open import Base.Char.Char
open import Base.Word8.from-nat
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind

serialize-bool : Bool -> ByteString
serialize-bool True  = cons (from-nat 1) (pack-string "")
serialize-bool False = cons (from-nat 0) (pack-string "")

serialize-click : Click -> ByteString
serialize-click LeftButton = cons (from-nat 1) (pack-string "")
serialize-click RightButton = cons (from-nat 0) (pack-string "")

pack-string-fixed : String -> Nat -> Maybe ByteString
pack-string-fixed str length = do
  let fixed-str = take length (to-list str)
  let maybe-str = head fixed-str
  maybe-str >>= λ x → Some (pack-string (from-char x))

serialize : Event -> Maybe ByteString
serialize (KeyEvent s b) = do
  packed-string <- pack-string-fixed s 1
  let bool-byte = serialize-bool b
  Some (append (cons (from-nat 0) packed-string) bool-byte) -- TAG 0
serialize (MouseClick click x y) = do
  let click-byte = serialize-click click
  let x-bytes = write-f64-as-nat (pack-string "") 0 x
  let xy-bytes = write-f64-as-nat x-bytes 8 y
  Some (append (cons (from-nat 1) click-byte) xy-bytes) -- TAG 1
serialize (MouseMove x y) = do
  let initial-bytes = cons (from-nat 2) (pack-string "") -- TAG 2
  let x-bytes = write-f64-as-nat initial-bytes 1 x
  let xy-bytes = write-f64-as-nat x-bytes 9 y
  Some xy-bytes

-- to deserialize, i need to postulate some functions because Word8 is a postulated type so idk the value to match on
-- the other way is to declare Word8 as Nat and then use fromIntegral on compilation maybe? but ill keep on haskell side from now

postulate
  deserialize-bool : Word8 -> Bool
  deserialize-click : Word8 -> Click

-- New auxiliary functions for deserialization
postulate
  read-f64 : ByteString -> Nat -> F64
  read-char : ByteString -> Char

deserialize-key-event : ByteString -> Maybe Event
deserialize-key-event bs = do
  let key = from-char (read-char (BS.tail bs))
  let bool-byte = BS.head (BS.tail (BS.tail bs))
  Some (KeyEvent key (deserialize-bool bool-byte))

deserialize-mouse-click : ByteString -> Maybe Event
deserialize-mouse-click bs = do
  let click-byte = BS.head (BS.tail bs)
  let x = read-f64 bs 2
  let y = read-f64 bs 10
  Some (MouseClick (deserialize-click click-byte) x y)

deserialize-mouse-move : ByteString -> Maybe Event
deserialize-mouse-move bs = do
  let x = read-f64 bs 1
  let y = read-f64 bs 9
  Some (MouseMove x y)

deserialize : ByteString -> Maybe Event
deserialize bs with (to-nat (BS.head bs))
... | 0 = deserialize-key-event bs
... | 1 = deserialize-mouse-click bs
... | 2 = deserialize-mouse-move bs
... | _ = None

