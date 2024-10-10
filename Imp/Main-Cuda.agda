module Imp.Main-Cuda where

open import Base.IO.IO
open import Base.IO.print
open import Base.List.List
open import Base.U64.from-nat
open import Base.Nat.Nat
open import Base.Unit.Unit
open import Imp.Backend.Cuda.grid-to-cuda
open import Imp.Eval.Config.Grid.Grid
open import Imp.Notation
open import Imp.Expr.Expr
open import Imp.Stmt.Stmt

private
  infix 100 #_
  #_ : Nat -> Expr
  # x = Num (from-nat x)

code : Stmt
code = do
  local ("i" :: [])

  "i" := gid
  global[ gid ]= gid

  if gid < # 2
    then return # 0
    else noop

  while ($"i" < # 256) go do
    "i" += gid
    global[ $"i" ]= # 0

-- a grid of 16 blocks of 16 threads and sizeof(u64) * 16^2 global memory
grid : Grid
grid = MkGrid 256 0 16 16 code

main : IO Unit
main = do
  print (grid-to-cuda grid)

