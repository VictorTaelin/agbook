module Bend.Fun.Term.foldr-lam where

open import Base.List.List
open import Base.List.foldr
open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Pattern.Pattern

foldr-lam : Term → List (Maybe String) → Term
foldr-lam bod bnd = foldr (λ bnd bod → Lam (Pattern.Var bnd) bod) bod bnd
