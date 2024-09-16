module Data.String.Type where
  
open import Data.Bool.Type

postulate String : Set
{-# BUILTIN STRING String #-}


primitive
  primStringEquality : String → String → Bool
  primShowString : String → String