module Bend.Fun.Pattern.binds where

open import Base.List.Type
open import Base.List.concat-map
open import Base.String.Type
open import Base.Maybe.Type
open import Bend.Fun.Pattern.Type

binds : Pattern → List String
binds (Var (Some name)) = name :: []
binds (Var None) = []
binds (Chn _) = []
binds (Fan _ pats) = concat-map binds pats
binds (Ctr _ pats) = concat-map binds pats
binds (Lst pats)   = concat-map binds pats
binds (Num _) = []
binds (Str _) = []
