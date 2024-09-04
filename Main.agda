module Main where

open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.pure
open import Data.IO.print
open import Data.Map.Type
open import Data.Map.new
open import Data.Map.set
open import Data.Map.to-list
open import Data.List.Type
open import Data.List.map
open import Data.Bits.Type
open import Data.Bits.show
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.String.Type
open import Data.String.append

-- Helper function to print a single Bits key
print-key : Bits → IO Unit
print-key key = print (show key)

-- Main function that sets a key in a Map, converts it to a list, and prints each key
main : IO Unit
main = 
  let
    -- Create a new empty map
    empty-map = new {Unit}
    -- Set the key (O (I E)) in the map
    test-map = set empty-map (O (I E)) unit
    -- Convert the map to a list of pairs
    map-list = to-list test-map
    -- Extract the keys (Bits) from the list of pairs
    keys = map fst map-list
  in
  -- Print each key
  foldr (λ key io → io >>= λ _ → print-key key) (pure unit) keys