module Bend.Fun.FnDef.new-gen where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.List.List
open import Base.String.String
open import Bend.Fun.Term.Term using (Term)
open import Bend.Source.Source
open import Bend.Source.SourceKind
open import Bend.Source.is-builtin
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.Type.Type as Type

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

new-gen : String -> List Rule -> Source -> Bool -> FnDef
new-gen name rules source check = do
  let kind   = if is-builtin source then Builtin else Generated
  let source = record source { kind = kind }
  MkFnDef name Type.Hole check rules source
