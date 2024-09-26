module Base.ByteString.write-f64-as-nat where

open import Base.ByteString.ByteString
open import Base.ByteString.write-u48
open import Base.Nat.Nat
open import Base.F64.F64
open import Base.Int.to-nat
open import Base.Int.Int
open import Base.F64.floor
open import Base.Maybe.Maybe

handle-maybe : Maybe Int -> Int
handle-maybe (Some x) = x
handle-maybe None     = Pos 0

write-f64-as-nat : ByteString -> Nat -> F64 -> ByteString
write-f64-as-nat bs pos value = do
  let nat-val = to-nat (handle-maybe (floor value))
  write-u48 bs pos nat-val

