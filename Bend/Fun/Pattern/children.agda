module Bend.Fun.Pattern.children where

open import Base.List.Type
open import Bend.Fun.Pattern.Type

children : Pattern -> List Pattern
children (Var _) = []
children (Chn _) = []
children (Fan _ pats) = pats
children (Ctr _ pats) = pats
children (Num _) = []
children (Lst pats) = pats
children (Str _) = []
