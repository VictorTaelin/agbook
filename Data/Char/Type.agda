module Data.Char.Type where
  
open import Data.Bool.Type

postulate Char : Set
{-# BUILTIN CHAR Char #-}

primitive
  primCharEquality : Char → Char → Bool
