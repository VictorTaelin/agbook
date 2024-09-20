module Base.Bits.lt where

open import Base.Bits.Type
open import Base.Bool.Type

lt : Bits → Bits → Bool
lt E     E     = False
lt E     (O _) = True
lt E     (I _) = True
lt (O _) E     = False
lt (I _) E     = False
lt (O a) (O b) = lt a b
lt (O a) (I _) = True
lt (I a) (O _) = False
lt (I a) (I b) = lt a b
