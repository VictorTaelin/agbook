module Base.ByteString.read-f64 where

open import Base.ByteString.ByteString
open import Base.ByteString.read-u48
open import Base.Nat.Nat
open import Base.F64.F64
open import Base.F64.from-nat

read-f64 : ByteString → Nat → F64
read-f64 bs index = do
  let nat-val = read-u48 bs index
  from-nat nat-val
  
  
