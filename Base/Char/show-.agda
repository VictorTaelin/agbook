module Base.Char.show- where

open import Base.Char.Char
open import Base.Char.show
open import Base.String.String
open import Base.Equal.Equal

-- Tests for the show function on various characters.

-- Tests if show 'a' equals "'a'".
T0 : show 'a' ≡ "'a'"
T0 = refl

-- Tests if show '0' equals "'0'".
T1 : show '0' ≡ "'0'"
T1 = refl

-- Tests if show '\n' equals "'\n'".
T2 : show '\n' ≡ "'\n'"
T2 = refl

-- Tests if show ' ' equals "' '".
T3 : show ' ' ≡ "' '"
T3 = refl