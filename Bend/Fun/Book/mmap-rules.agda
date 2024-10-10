module Bend.Fun.Book.mmap-rules where

open import Base.List.mmap
open import Base.Trait.Monad
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
import Base.BinMap.mmap as BinMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

mmap-rules : ∀ {M : Set → Set} {{monadM : Monad M}} → (Rule → M Rule) → Book → M Book
mmap-rules f book = do
  defs ← BinMap.mmap (mmap-def f) (Book.defs book)
  pure (record book { defs = defs })

  where
  mmap-def : ∀ {M : Set → Set} {{monadM : Monad M}} → (Rule → M Rule) → FnDef → M FnDef
  mmap-def f def = do
    rules ← mmap f (FnDef.rules def)
    pure (record def { rules = rules })
