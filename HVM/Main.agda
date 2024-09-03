module HVM.Main where

open import Data.Bits.Type
open import Data.IO.Type
open import Data.IO.print
open import Data.List.Type
open import Data.Unit.Type
open import HVM.Net.Type
import HVM.Net.show as Net
open import HVM.Redex.Type
open import HVM.Term.Type

-- Creates a demo net
demo-net : Net
demo-net = do
  let root   = Con (Var (I (O E))) (Dup Era (Var (O (I E))))
  let redex1 = MkRedex (Var (I (I E))) (Con Era Era)
  let redex2 = MkRedex (Dup (Var (O (O E))) Era) (Var (I (O E)))
  let rbag   = redex1 :: redex2 :: []
  MkNet rbag root

-- Main function that creates a demo net and prints it
main : IO Unit
main = do
  let net = demo-net
  let str = Net.show net
  print str
