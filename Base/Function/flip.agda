module Base.Function.flip where

-- Flips the order of the first two arguments of a function.
-- - f: The function whose arguments are to be flipped.
-- - y: The second argument to f, which becomes the first.
-- - x: The first argument to f, which becomes the second.
-- = The result of applying f with its first two arguments swapped.
flip : ∀ {a b c} {A : Set a} {B : Set b} {C : Set c} → (A → B → C) → B → A → C
flip f y x = f x y
