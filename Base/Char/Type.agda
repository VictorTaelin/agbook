module Base.Char.Type where
  
open import Base.Bool.Type

postulate Char : Set
{-# BUILTIN CHAR Char #-}

primitive
  primCharEquality : Char → Char → Bool
