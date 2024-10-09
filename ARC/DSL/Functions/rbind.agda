module ARC.DSL.Functions.rbind where

open import Base.Function.ALL

-- Implements right-binding for functions of different arities.
-- - fn: The function to be right-bound.
-- - fixed: The value to be fixed as the rightmost argument.
-- = A new function with its rightmost argument fixed.
rbind : ∀ {a b c d} {A : Set a} {B : Set b} {C : Set c} {D : Set d}
      → (A → B → C)
      → B
      → (A → C)
rbind fn fixed = λ x → fn x fixed

-- Note: This implementation covers the 2-argument case.
-- For 3 and 4 argument cases, additional functions would be needed:

rbind3 : ∀ {a b c d e} {A : Set a} {B : Set b} {C : Set c} {D : Set d} {E : Set e}
       → (A → B → C → D)
       → C
       → (A → B → D)
rbind3 fn fixed = λ x y → fn x y fixed

rbind4 : ∀ {a b c d e f} {A : Set a} {B : Set b} {C : Set c} {D : Set d} {E : Set e} {F : Set f}
       → (A → B → C → D → E)
       → D
       → (A → B → C → E)
rbind4 fn fixed = λ x y z → fn x y z fixed

