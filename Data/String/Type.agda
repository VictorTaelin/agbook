module Data.String.Type where

postulate String : Set
{-# BUILTIN STRING String #-}


primitive
  primStringEquality : String → String → Bool