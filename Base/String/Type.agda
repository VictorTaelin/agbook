module Base.String.Type where
  
open import Base.Bool.Type

postulate String : Set
{-# BUILTIN STRING String #-}


primitive
  primStringEquality : String → String → Bool
  primShowString : String → String