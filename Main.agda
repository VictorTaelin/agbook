module Main where

-- open import Base.ALL

open import Base.IO.Monad.bind
open import Base.Unit.Type
open import Base.IO.Type
open import Base.IO.print

main : IO Unit
main = do
  print "Hello, world!"
  print "Hello, world!"
