module Main where

open import Data.Unit.Type
open import Data.IO.Type
open import Data.IO.print

-- A simple "Hello, World!" program
-- = An IO action that prints "Hello, World!" to the console
main : IO Unit
main = print "Hello, World!"
