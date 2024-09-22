module Main where

-- open import Base.ALL

open import Base.IO.Monad.bind
open import Base.IO.Type
open import Base.IO.print
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Nat.show
open import Base.String.append
open import Base.Unit.Type

loop : Nat -> IO Unit
loop i = do
  print ("Hello " ++ show i)
  loop (i + 1)

main : IO Unit
main = loop 0
