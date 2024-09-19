module Test.T0 where

open import Base.Bits.Type
open import Base.Map.Type
open import Base.Map.get
open import Base.Map.new
open import Base.Map.set
open import Base.Map.show
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add

open import Base.String.Type

main : Maybe Nat
main =
  let m = new
      m = set m (O (O E)) 10
      m = set m (I (I E)) 20
      m = set m (O (I E)) 30
      x = get m (O (O E))
  in x
