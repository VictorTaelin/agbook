module Base.String.compare where

open import Base.String.Type
import Base.String.eq as String
import Base.String.lt as String
open import Base.Ordering.Type
open import Base.Bool.Type
open import Base.Bool.if

-- Compares two strings lexicographically.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = EQ if the strings are equal, 
--   LT if the first string is less than the second,
--   GT if the first string is greater than the second.
compare : String -> String -> Ordering
compare s1 s2 with String.eq s1 s2 
... | True = EQ
... | _ with String.lt s1 s2 
...   | True = LT
...   | False = GT


  
