module Base.Bits.gt where

open import Base.Bits.Type
open import Base.Bool.Type

gt : Bits -> Bits -> Bool
gt E     E     = False
gt E     (O _) = False
gt E     (I _) = False
gt (O _) E     = True
gt (I _) E     = True
gt (O a) (O b) = gt a b
gt (O _) (I _) = False
gt (I _) (O _) = True
gt (I a) (I b) = gt a b

infix 4 _>_
_>_ : Bits -> Bits -> Bool
_>_ = gt
