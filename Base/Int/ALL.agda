module Base.Int.ALL where

open import Base.Int.Type public
open import Base.Int.to-bits public

-- Re-export the Int type and its constructors
open Base.Int.Type public using (Int; Pos; NegSuc)

-- Re-export any specific functions from Type if necessary
-- For example:
-- open Base.Int.Type public using (primShowInteger)
