module Bend.Fun.Type.show where

open import Bend.Fun.Type.Type
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.List.List
open import Base.List.map
open import Base.List.intersperse
open import Base.List.concat
open import Base.Trait.Show
open import Base.Bool.Bool
open import Base.Bool.if


instance
  {-# TERMINATING #-} -- FIXME!
  ShowType : Show Type
  ShowType = record { to-string = show-type }
    where
      show-type-arrow : Type → String
      show-type-arrow (Arr dom cod) = show dom ++ " → " ++ show-type-arrow cod
      show-type-arrow t = show t

      show-type : Type → String
      show-type Any = "Any"
      show-type Hole = "_"
      show-type (Var name) = name
      show-type (Arr dom cod) = "(" ++ show dom ++ " → " ++ show-type-arrow cod ++ ")"
      show-type (Ctr name []) = name
      show-type (Ctr name args) =  "(" ++ name ++ " " ++ join " " (map show args) ++ ")"
      show-type (Tup els) = "(" ++ join ", " (map show els) ++ ")"
      show-type U24 = "u24"
      show-type I24 = "i24"
      show-type F24 = "f24"
      show-type None = "None"
      show-type (Num t) = "(Number " ++ show t ++ ")"
      show-type (Int t) = "(Integer " ++ show t ++ ")"
