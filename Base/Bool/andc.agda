module Base.Bool.andc where

open import Base.Bool.Bool

-- Performs logical  And with complement 1st & ~2nd.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if both 1st and 2nd are true.
andc : Bool → Bool → Bool
andc True False = True
andc a    b     = False


