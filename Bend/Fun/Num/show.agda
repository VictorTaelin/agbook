module Bend.Fun.Num.show where

open import Bend.Fun.Num.Type renaming (Num to Num')
open import Base.String.Type
open import Base.String.append
open import Base.Nat.Type
open import Base.Nat.show
open import Base.Int.Type
open import Base.Float.show
open import Base.Trait.Show

instance
  ShowNum : Show Num'
  ShowNum = record { to-string = show-num }
    where
      show-num : Num' → String
      show-num (U24 n) = show n
      show-num (I24 n) = show-int n
        where
          show-int : Int → String
          show-int (Pos n) = "+" ++ show n
          show-int (NegSuc n) = "-" ++ show (Succ n)
      show-num (F24 f) = show f
