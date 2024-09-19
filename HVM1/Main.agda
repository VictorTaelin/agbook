module HVM1.Main where

open import Base.IO.Type
open import Base.IO.print
open import Base.String.Type
open import Base.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure

main : IO Unit
main = do
  print "Hello, World"
