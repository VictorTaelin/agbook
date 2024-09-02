module Main where

open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.put-str-ln

-- A simple "Hello, World!" program
-- = An IO action that prints "Hello, World!" to the console
main : IO Unit
main = put-str-ln "Hello, World!"
