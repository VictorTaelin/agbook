module Main0 where

open import Data.Bits.Type
open import Data.Bits.show
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.print
open import Data.List.Type
open import Data.List.map
open import Data.Map.Type
open import Data.Map.empty
open import Data.Map.set
open import Data.Map.swap
open import Data.Map.to-list
open import Data.Pair.Type
open import Data.String.from-list
open import Data.Unit.Type

-- Helper function to print a single key
print-key : Pair Bits Unit → IO Unit
print-key (key , _) = print (show key)

-- Helper function to print all keys in the list
print-keys : List (Pair Bits Unit) → IO Unit
print-keys []       = print "Done"
print-keys (x :: xs) = print-key x >>= λ _ → print-keys xs

-- Main function that sets a key in a map, converts it to a list, and prints the keys
main : IO Unit
main = do
  let empty-map          = empty {Unit}
  let test-key           = O (O (I E))
  let map-with-key , old = swap empty-map test-key unit
  let key-value-list     = to-list map-with-key
  print "Map keys:" >>= λ _ →
    print-keys key-value-list
