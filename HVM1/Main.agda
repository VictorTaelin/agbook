module HVM1.Main where

open import Base.IO.IO
open import Base.IO.print
open import Base.String.String
open import Base.Unit.Unit
open import HVM1.Run.State.State
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure

main : IO Unit
main = do
  print "Hello, World"
