module UG.SIPD.FFI.Event where

open import Data.Float.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Nat.eq
open import Data.Function.case
open import Data.String.Type
open import UG.SIPD.FFI.ByteString
open import UG.SIPD.FFI.Word8
open import UG.SIPD.FFI.pack
open import UG.SIPD.FFI.nat-to-word8
open import UG.SIPD.FFI.word8-to-nat
open import UG.SIPD.FFI.unpack
open import Data.Maybe.Type

data Click : Set where
  LeftButton : Click
  RightButton : Click

data Event : Set where
  KeyEvent : String -> Bool -> Event
  MouseClick : Click -> Float → Float → Event
  MouseMove : Float -> Float -> Event 

bool-to-nat : Bool -> Nat
bool-to-nat True  = 1
bool-to-nat False = 0

nat-to-bool : Nat -> Bool
nat-to-bool 0 = False
nat-to-bool _ = True

buffer-write : ByteString -> Word8 -> ByteString
buffer-write = {!!}

write-u48 : ByteString -> Nat -> Nat -> ByteString
write-u48 bs num idx = {!!}

write-fu48 : ByteString -> Float -> Nat -> ByteString
write-fu48 bs num idx = {!!}

serialize-key-event : String -> Bool -> Nat -> ByteString
serialize-key-event key up time = do
  let tag = 0
  let buffer = pack "" 
  let buffer1 = buffer-write buffer (nat-to-word8 tag) -- 0 is tag
  let buffer2 = write-u48 buffer1 time 1
  let buffer3 = buffer-write buffer2 (nat-to-word8 (bool-to-nat up))
  buffer3

serialize-mouse-click : Click -> Float -> Float -> Nat -> ByteString
serialize-mouse-click LeftButton x y time = do
  let tag = 1
  let buffer = pack ""
  let buffer1 = buffer-write buffer (nat-to-word8 tag)
  let buffer2 = write-u48 buffer1 time 1
  let buffer3 = buffer-write buffer2 (nat-to-word8 0)
  let buffer4 = write-fu48 buffer3 x 8
  let buffer5 = write-fu48 buffer4 y 14
  buffer5
serialize-mouse-click RightButton x y time = do
  let tag = 1
  let buffer = pack ""
  let buffer1 = buffer-write buffer (nat-to-word8 tag)
  let buffer2 = write-u48 buffer1 time 1
  let buffer3 = buffer-write buffer2 (nat-to-word8 1)
  let buffer4 = write-fu48 buffer3 x 8
  let buffer5 = write-fu48 buffer4 y 14
  buffer5

serialize-mouse-move : Float -> Float -> Nat -> ByteString
serialize-mouse-move x y time = do
  let tag = 2
  let buffer = pack ""
  let buffer1 = buffer-write buffer (nat-to-word8 tag)
  let buffer2 = write-u48 buffer1 time 1
  let buffer3 = write-fu48 buffer2 x 7
  let buffer4 = write-fu48 buffer3 y 13
  buffer4

serialize : Event -> Nat -> ByteString
serialize (KeyEvent key up) time  = serialize-key-event key up time
serialize (MouseClick LeftButton x y) time = serialize-mouse-click LeftButton x y time
serialize (MouseClick RightButton x y) time = serialize-mouse-click RightButton x y time
serialize (MouseMove x y) time = serialize-mouse-move x y time

buffer-read : ByteString -> Word8
buffer-read = {!!}

read-u48 : ByteString -> Nat -> Nat
read-u48 bs idx = {!!}

read-fu48 : ByteString -> Nat -> Float
read-fu48 bs idx = {!!}

get-at : ByteString -> Nat -> Word8
get-at = {!!}

deserialize-key-event : ByteString -> Event
deserialize-key-event bs = do
  let time = read-u48 bs 1
  let up = nat-to-bool (word8-to-nat (get-at bs 7))
  let key = {!!}  
-- FIXME
  MouseMove 1.0 2.0

deserialize-mouse-click : ByteString -> Event
deserialize-mouse-click bs = do
  let time = read-u48 bs 1
  let click-type = word8-to-nat (get-at bs 7)
  let x = read-fu48 bs 8
  let y = read-fu48 bs 14
  let click = if click-type == 0 then LeftButton else RightButton
  MouseClick click x y

deserialize-mouse-move : ByteString -> Event
deserialize-mouse-move bs = do
  let time = read-u48 bs 1
  let x = read-fu48 bs 7
  let y = read-fu48 bs 13
  MouseMove x y

deserialize : ByteString -> Maybe Event
deserialize bs = 
  let tag = word8-to-nat (buffer-read bs) in
  case tag of
    0 -> Some (deserialize-key-event bs)
    1 -> Some (deserialize-mouse-click bs)
    2 -> Some (deserialize-mouse-move bs)
    _ -> None

{-# FOREIGN GHC

import qualified Data.Text as T

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double

#-}

{-# COMPILE GHC Click = data AgdaClick (ALeftButton | ARightButton) #-}
{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}

