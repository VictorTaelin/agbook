module Test.T0 where

open import Base.Bits.Bits
open import Base.BitMap.BitMap
open import Base.BitMap.get
open import Base.BitMap.new
open import Base.BitMap.set
open import Base.BitMap.show
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add

open import Base.String.String

main : Maybe Nat
main =
  let m = new
      m = set m (O (O E)) 10
      m = set m (I (I E)) 20
      m = set m (O (I E)) 30
      x = get m (O (O E))
  in x
