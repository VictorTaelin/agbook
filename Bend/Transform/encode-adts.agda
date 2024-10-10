module Bend.Transform.encode-adts where

open import Base.BinMap.values
open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Function.case
open import Base.Function.flip
open import Base.List.List
open import Base.List.concat
open import Base.List.enumerate
open import Base.List.foldr
open import Base.List.map
open import Base.List.mfoldl
open import Base.List.mmap
open import Base.Maybe.Maybe
open import Base.Maybe.Trait.Monad
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Base.Trait.Monad
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Adt.CtrField
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.add-fn-def
open import Bend.Fun.Book.get-adt
open import Bend.Fun.Book.get-ctr
open import Bend.Fun.FnDef.new-gen
open import Bend.Fun.Num.Num
open import Bend.Fun.Term.Term renaming (List to List' ; Num to Num')
open import Bend.Fun.Term.foldl-app
open import Bend.Fun.Term.foldr-lam
open import Bend.Fun.Type.Type renaming (Ctr to Ctr')
open import Bend.Run.AdtEncoding
import Bend.Fun.Pattern.Pattern as Pat
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

encode-adts : AdtEncoding -> Book -> Result Book String
encode-adts encoding book = do
  let adt-nams = map (λ adt -> Adt.nam adt) (values (Book.adts book))
  mfoldl (encode-adt encoding) book adt-nams

  where

  encode-ctr-scott : Adt -> Ctr -> List FnDef
  encode-ctr-scott (MkAdt adt-nam _ ctrs src) (MkCtr nam _ typ fields) = do
    let args = map CtrField.nam fields
    let bod = Var nam
    let bod = foldl-app bod (map Var args)
    let bod = foldr-lam bod (map Some ctrs)
    let bod = foldr-lam bod (map Some args)
    (MkFnDef nam typ True (MkRule [] bod :: []) src) :: []

  encode-ctr-num-scott : Adt -> (Pair Nat Ctr) -> List FnDef
  encode-ctr-num-scott (MkAdt adt-nam _ ctrs src) (tag , (MkCtr nam _ typ fields)) = do
    let tag-nam = nam ++ "/tag"
    let tag-def = new-gen tag-nam (MkRule [] (Num' (U24 tag)) :: []) src True
    let x       = "%x"
    let bod     = (App (Var x) (Ref tag-nam))
    let bod     = foldl-app bod (map (λ a -> Var (CtrField.nam a)) fields)
    let bod     = Lam (Pat.Var (Some x)) bod
    let bod     = foldr-lam bod (map (λ f → Some (CtrField.nam f)) fields)
    let ctr-def = MkFnDef nam typ True (MkRule [] bod :: []) src
    tag-def :: ctr-def :: []

  encode-adt : AdtEncoding -> Book -> String -> Result Book String
  encode-adt encoding book adt-name = do
    adt  <- to-result (get-adt book adt-name) "Adt not found"
    ctrs <- to-result (mmap (get-ctr book) (Adt.ctr adt)) "Ctr not found"
    let defs = case encoding of λ where
      Scott    -> map (encode-ctr-scott     adt) ctrs
      NumScott -> map (encode-ctr-num-scott adt) (enumerate ctrs)
    let book = foldr (flip add-fn-def) book (concat defs)
    Done book

