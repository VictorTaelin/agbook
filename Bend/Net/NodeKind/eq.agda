module Bend.Net.NodeKind.eq where

open import Bend.Net.NodeKind.NodeKind
open import Base.Bool.Bool
import Base.String.eq as String
import Base.Bits.eq as Bits

-- Equality function for NodeKind
-- - x: The first NodeKind to compare
-- - y: The second NodeKind to compare
-- = True if x and y are equal, False otherwise
eq : NodeKind → NodeKind → Bool
eq Rot       Rot       = True
eq Era       Era       = True
eq Con       Con       = True
eq Dup       Dup       = True
eq Var       Var       = True
eq (Ref s1)  (Ref s2)  = String.eq s1 s2
eq (Num b1)  (Num b2)  = Bits.eq b1 b2
eq Opr       Opr       = True
eq Swi       Swi       = True
eq _         _         = False

-- Infix operator for NodeKind equality
infix 4 _==_
_==_ : NodeKind → NodeKind → Bool
_==_ = eq

