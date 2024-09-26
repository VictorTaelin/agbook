module Bend.Fun.Pattern.children where

open import Base.List.List
open import Bend.Fun.Pattern.Pattern

children : Pattern -> List Pattern
children (Var _) = []
children (Chn _) = []
children (Fan _ pats) = pats
children (Ctr _ pats) = pats
children (Num _) = []
children (Lst pats) = pats
children (Str _) = []
