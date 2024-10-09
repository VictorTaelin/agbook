module Imp.Main-C where

open import Base.IO.IO
open import Base.IO.print
open import Base.List.List
open import Base.U64.from-nat
open import Base.Nat.Nat
open import Base.Unit.Unit
open import Imp.Backend.C.grid-to-c
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

  "i" += gid
  while ($"i" < # 256) go do
    global[ $"i" ]= # 0
    "i" += gid

-- a grid of 16 blocks of 16 threads and sizeof(u64) * 16^2 global memory
grid : Grid
grid = MkGrid 256 0 16 16 code

main : IO Unit
main = do
  print (grid-to-c grid)
