module HVM.Main where

open import Base.Nat.Nat
open import HVM.HVM

<<<<<<< HEAD
main : Nat
main = 70
=======
open import Base.Function.case
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.print
open import Base.Pair.Pair
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Result.Result
open import Base.String.String
open import Base.String.append
open import Base.Unit.Unit
open import HVM.Net.Net
open import HVM.Parser.parse-net
open import HVM.Redex.Redex
open import HVM.Run.evaluate


-- Main function that creates a demo net, evaluates it, and prints it
main : IO Unit
main =
  let test-net = "r & ((x x) r) ~ ({y (y z)} z)" in
  case parse-net (new-parser-state test-net) of λ where
    (Done reply) → do
      let
        initial-net = Reply.value reply
        final-net = evaluate initial-net

      print ("Initial net: " ++ (Net.show initial-net))
      print ("Final term: " ++ (Term.show final-net))

    (Fail error) →
      print ("Failed to parse net: " ++ Error.error error)

>>>>>>> 4f776a6e4ed569dca50e1db5a88fea20d909f480
