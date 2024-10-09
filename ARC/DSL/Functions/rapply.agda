module ARC.DSL.Functions.rapply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Functions.apply
open import ARC.DSL.Functions.container-to-list

open import Base.Trait.Ord

-- Applies each function in a container to a given value.
-- - fs: Container of functions.
-- - x: The value to apply the functions to.
-- = A new container with the results of applying each function to x.
rapply : ∀ {A B : Set} {{_ : Ord B}} → Container (A → B) → A → Container B
rapply fs x = apply (λ f → f x) fs

