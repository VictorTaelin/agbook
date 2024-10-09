module Bend.Fun.Term.unscoped-vars where

open import Base.List.List
open import Base.List.append
open import Base.List.concat
open import Base.List.map
open import Base.List.unzip
open import Base.String.String
open import Base.Pair.Pair
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Pattern.unscoped-binds

unscoped-vars : Term → Pair (List String) (List String)

unscoped-vars (Link nam) = do
  ([] , nam :: [])

unscoped-vars (Lam pat bod) = do
  let decls           = unscoped-binds pat
  let (decls' , uses) = unscoped-vars bod
  (decls ++ decls' , uses)

unscoped-vars (Let pat val nxt) = do
  let decls            = unscoped-binds pat
  let (decls1 , uses1) = unscoped-vars val
  let (decls2 , uses2) = unscoped-vars nxt
  (decls ++ decls1 ++ decls2 , uses1 ++ uses2)

unscoped-vars term = do
  let (decls , uses) = unzip (map unscoped-vars (children term))
  (concat decls , concat uses)

