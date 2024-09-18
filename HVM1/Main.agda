module HVM1.Main where

open import Data.IO.Type
open import Data.IO.print
open import Data.String.Type
open import Data.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.pure

-- A simple Run computation that prints "Hello, World!"
main : IO Unit
main = do
  print "Hello, World!!! 5"
