module Data.String.Test.lte where

open import Data.String.Type
open import Data.String.lte
open import Data.Equal.Type
open import Data.Bool.Type

-- Test case 1: Empty strings
test-lte-empty : ("" <= "") === True
test-lte-empty = refl

-- Test case 2: Empty string and non-empty string
test-lte-empty-nonempty : ("" <= "a") === True
test-lte-empty-nonempty = refl

-- Test case 3: Non-empty string and empty string
test-lte-nonempty-empty : ("a" <= "") === False
test-lte-nonempty-empty = refl

-- Test case 4: Equal strings
test-lte-equal : ("hello" <= "hello") === True
test-lte-equal = refl

-- Test case 5: Lexicographically less
test-lte-less : ("apple" <= "banana") === True
test-lte-less = refl

-- Test case 6: Lexicographically greater
test-lte-greater : ("zebra" <= "aardvark") === False
test-lte-greater = refl

-- Test case 7: Prefix string
test-lte-prefix : ("cat" <= "caterpillar") === True
test-lte-prefix = refl

-- Test case 8: Same first character, different second
test-lte-same-first : ("dog" <= "dot") === True
test-lte-same-first = refl

-- Test case 9: Unicode strings
test-lte-unicode : ("αβγ" <= "αβδ") === True
test-lte-unicode = refl
