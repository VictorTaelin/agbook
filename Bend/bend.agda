module Bend.bend where

open import Base.Function.case
open import Base.IO.IO
open import Base.IO.Trait.Monad
open import Base.IO.get-args
open import Base.IO.print
open import Base.Maybe.Maybe
open import Base.List.List
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.Result.fold
open import Base.String.String
open import Base.String.append
open import Base.Trait.Monad
open import Base.Trait.Show
open import Base.Unit.Unit
open import Bend.Cli.Command.Command
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.show
open import Bend.Load.load-book
open import Bend.Run.to-bend-core
open import Bend.Run.to-hvm
open import Bend.Run.show-hvm
import Bend.Cli.Command.from-string as Command

gen-bend : Book → String
gen-bend book = show book

gen-core : Book → String
gen-core book = fold
  (λ book → show book)
  (λ err → "Compile error: " ++ err)
  (to-bend-core book)

gen-hvm : Book → String
gen-hvm book = fold
  (λ nets → show-hvm nets)
  (λ err → "Compile error: " ++ err)
  (do
    book <- to-bend-core book
    to-hvm book)

usage : String
usage = "Usage: bend [gen-bend|gen-core|gen-hvm] <file>"

main : IO Unit
main = do
  args <- get-args
  case args of λ where
    (cmd :: file :: []) → do
      let cmd = Command.from-string cmd
      book   <- load-book file
      case cmd , book of λ where
        ((Some GenBend) , (Done book)) → print ("Generating bend:\n" ++ gen-bend book)
        ((Some GenCore) , (Done book)) → print ("Generating bend-core:\n" ++ gen-core book)
        ((Some GenHvm)  , (Done book)) → print ("Generating hvm:\n" ++ gen-hvm book)
        (None           , _          ) → print usage
        (_              , (Fail err) ) → print ("Compile error: " ++ err)
    _ → print usage

