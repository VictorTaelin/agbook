module Test.T0 where

open import Data.Bits.Type
open import Data.Map.Type
open import Data.Map.get
open import Data.Map.new
open import Data.Map.set
open import Data.Map.show
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.add

open import Data.String.Type

main : Maybe Nat
main =
  let m = new
      m = set m (O (O E)) 10
      m = set m (I (I E)) 20
      m = set m (O (I E)) 30
      x = get m (O (O E))
  in x
