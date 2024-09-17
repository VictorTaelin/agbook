module Bend.Fun.Num.show where

open import Bend.Fun.Num.Type renaming (Num to Num')
open import Data.String.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Int.Type
open import Data.Float.show
open import Data.Trait.Show

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
