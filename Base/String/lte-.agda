module Base.String.lte- where

open import Base.String.String
open import Base.String.lte
open import Base.Equal.Equal
open import Base.Bool.Bool

-- Test case 1: Empty strings
test-lte-empty : (lte "" "") ≡ True
test-lte-empty = refl

-- Test case 2: Empty string and non-empty string
test-lte-empty-nonempty : (lte "" "a") ≡ True
test-lte-empty-nonempty = refl

-- Test case 3: Non-empty string and empty string
test-lte-nonempty-empty : (lte "a" "") ≡ False
test-lte-nonempty-empty = refl

-- Test case 4: Equal strings
test-lte-equal : (lte "hello" "hello") ≡ True
test-lte-equal = refl

-- Test case 5: Lexicographically less
test-lte-less : (lte "apple" "banana") ≡ True
test-lte-less = refl

-- Test case 6: Lexicographically greater
test-lte-greater : (lte "zebra" "aardvark") ≡ False
test-lte-greater = refl

-- Test case 7: Prefix string
test-lte-prefix : (lte "cat" "caterpillar") ≡ True
test-lte-prefix = refl

-- Test case 8: Same first character, different second
test-lte-same-first : (lte "dog" "dot") ≡ True
test-lte-same-first = refl

-- Test case 9: Unicode strings
test-lte-unicode : (lte "αβγ" "αβδ") ≡ True
test-lte-unicode = refl
