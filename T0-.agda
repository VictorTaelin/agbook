module T0- where

open import Base.Bits.Bits
open import Base.BinMap.BinMap
open import Base.BinMap.get
open import Base.BinMap.new
open import Base.BinMap.set
open import Base.BinMap.show
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

